#!/bin/bash

sudo ./voltageshift --damage offset -110 -200 -110       # undervoltage

while true; do
	sudo ./voltageshift write 0x610 0x42814000dd80c8         # set LP1/LP2 to 25w/40w.  Actuallly 20w/30w are enough since TDP will never exceed 20w
	sudo ./voltageshift wrmem 0xfed159a0 0x42814000dd80c8 > /dev/null   # set 25w/40w in MCHBAR    However, I don't want to do the calculation to get he HEX values :)
	sleep 5
done
