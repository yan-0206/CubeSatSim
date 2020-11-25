#!/bin/bash
# script to decode SSTV using rtl_fm and QSSTV from the CubeSatSim

echo "Script to decode SSTV from the CubeSatSim for ARISS Radio Pi"

echo

sudo modprobe snd-aloop

sudo systemctl stop openwebrx

sudo systemctl stop rtl_tcp

pkill -o chromium &>/dev/null

sudo killall -9 rtl_tcp &>/dev/null

sudo killall -9 java &>/dev/null

sudo killall -9 CubicSDR &>/dev/null

rtl_fm -M fm -f 434.9M -s 48k | aplay -D hw:2,0,0 -r 48000 -t raw -f S16_LE -c 1 &

qsstv &

$SHELL