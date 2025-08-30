#!/usr/bin/env bash

rm /tmp/timer_daemon.sock
oxt_daemon &>/dev/null & disown;
