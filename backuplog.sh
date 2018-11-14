#!/bin/bash
logfile="home-assistant"
number=0
#in homeassistant folder check for log
while test -e "/home/homeassistant/.homeassistant/$logfile$suffix.log"; do
    (( ++number ))
    suffix="$( printf -- '-%02d' "$number" )"
done
#if is there, rename it to home-assistat-<increasing numbers>.log . actually doing backup log file
#TODO: make from multiple log one log
fname="$logfile$suffix.log"

printf 'Will use "%s" as filename\n' "$fname"
cp /home/homeassistant/.homeassistant/home-assistant.log /home/homeassistant/.homeassistant/$fname
