use std::env::args;
use std::io::prelude::*;
use std::os::unix::net::UnixStream;

fn main() {
    let args: Vec<String> = args().collect();
    let message = args[1..].join(" ");
    let mut socket = match  UnixStream::connect("/tmp/timer_daemon.sock") {
        Ok(sock) => sock,
        Err(e) => {
            println!("Couldn't connect: {e:?}");
            return
        }
    };

    match socket.write_fmt(format_args!("{message}")) {
        Ok(_) => {},
        Err(e) => {
            println!("Couldn't write: {e:?}");
        }
    }
}

