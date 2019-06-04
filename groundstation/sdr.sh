#!/bin/bash
# script to run OpenWebRX SDR

echo -e "\nScript to run SDR for CubeSat Simulator\n"

echo -e "IP Address to use in web browsers is: "

hostname -I|cut -f1 -d ' '

# kill openwebrx if running
ps -ef | grep rtl | grep -v grep | awk '{print $2}' | sudo xargs kill

cd ../openwebrx

sudo python openwebrx.py
