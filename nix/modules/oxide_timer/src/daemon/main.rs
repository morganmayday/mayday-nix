use std::io::prelude::*;
use std::os::unix::net::{UnixListener, UnixStream};
use std::time::{Duration, Instant};
use std::sync::{atomic::{AtomicBool, Ordering}, Arc};
use std::thread;
use humanize_duration::Truncate;
use humanize_duration::prelude::DurationExt;
use notify_rust::Notification;
use parse_duration::parse::Error as PD_Error;


fn main() -> std::io::Result<()> {
    let listener = UnixListener::bind("/tmp/timer_daemon.sock")?;
    listener.set_nonblocking(true).expect("Couldn't set nonblocking");
    println!("00.00");

    // set up handler for Ctrl-C
    let running = Arc::new(AtomicBool::new(true));
    let r = running.clone();

    ctrlc::set_handler(move || {
        r.store(false, Ordering::SeqCst);
    }).expect("Error setting Ctrl-C handler");

    // inside main loop of program, before Ctrl-C 
    // loop breaks as soon as sigint gets passed
    while running.load(Ordering::SeqCst) {
        if let Ok((mut socket, _)) = listener.accept() {
            let mut response = String::new();
            socket.read_to_string(&mut response)?;
            timer(response, &listener);
        }
    }

    // outside main loop, after Ctrl-C
    let _ = std::fs::remove_file("/tmp/timer_daemon.sock");
    Ok(())
}

fn timer(duration: String, listener: &UnixListener) {
    // duration from human-written timeframe
    let duration = parse_duration::parse(&duration);

    match duration {
        Ok(i) => {
            let duration = i;

            // notify that the timer is running
            send_started(&format!("{}", duration.human(Truncate::Second)));
    
            let start = Instant::now();
            let mut elapsed = start.elapsed();
    
            // main timer loop
            while ((duration - elapsed).as_millis()) > 0 {
                elapsed = start.elapsed();
    
                println!(
                    "{0:.2}",
                    (
                        ((duration - elapsed).as_millis()) as f32 
                        / 
                        duration.as_millis() as f32
                    ) 
                    * 100.0,
                    // this mess ^ outputs the duration remaining as a percent of the original length
                );
    
                let _ = std::io::stdout().flush();
                
                if let Ok((response, _)) = listener.accept() {
                    if is_quit(&response) {
    
                        send_canceled();
                        println!("00.00 ");
    
                        break
                    }
                    else {
                        send_busy(duration - elapsed);
                    }
                }
                
                thread::sleep(Duration::from_millis(1))
            };

            send_finished();
        },
        Err(e) => {
            send_error(e);
        } 
    }
}

fn is_quit(mut socket: &UnixStream) -> bool {
    let mut response = String::new();
    let _ = socket.read_to_string(&mut response);
    response == "QUIT"
}

fn send_busy(duration: Duration) {
    let mut notif = Notification::new();
    notif.summary("Timer busy!")
        .body(&format!("{} left on the clock.", duration.human(Truncate::Second)))
        .icon("timer-symbolic");

    if let Err(e) = notif.show() {println!("Unable to display notification: {e:?}")};
}

fn send_started(duration: &String) {
    let mut notif = Notification::new();
    notif.summary("Timer set!")
        .body(&format!("Timer has been set for {duration}."))
        .icon("timer-symbolic");

    if let Err(e) = notif.show() {println!("Unable to display notification: {e:?}")};
}

fn send_finished() {
    let mut notif = Notification::new();
    notif.summary("Timer finished!")
        .icon("timer-symbolic");

    if let Err(e) = notif.show() {println!("Unable to display notification: {e:?}")};
    play::play("chimes/bell.mp3").unwrap();
}

fn send_canceled() {
    let mut notif = Notification::new();
    notif.summary("Timer canceled!")
        .body("You canceled the currently running timer.")
        .icon("timer-symbolic");

    if let Err(e) = notif.show() {println!("Unable to display notification: {e:?}")};
}

fn send_error(error: PD_Error) {
    let mut notif = Notification::new();
    notif.summary("Timer error:")
        .body(&format!("{error}"))
        .icon("timer-symbolic");

    if let Err(e) = notif.show() {println!("Unable to display notification: {e:?}")};
}

