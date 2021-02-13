#!/bin/bash

# For stability we use -80 instead of -100 or smaller values
# With < -80 values, system may crash. If you face error code 11 in your browsers frequently, you should change -80 to bigger values
sudo ./voltageshift --damage offset -80 -500 -80       # undervoltage

while true; do
	sudo ./voltageshift write 0x610 0x42814000dd80c8         # set LP1/LP2 to 25w/40w.  Actuallly 20w/30w are enough since TDP will never exceed 20w
	sudo ./voltageshift wrmem 0xfed159a0 0x42814000dd80c8 > /dev/null   # set 25w/40w in MCHBAR    However, I don't want to do the calculation to get he HEX values :)
	sleep 5
done
