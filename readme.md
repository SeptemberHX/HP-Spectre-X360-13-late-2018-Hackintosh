# Hackintosh for HP Spectre-X360-13 late 2018

Please check https://github.com/jpuxdev/HP-Spectre-X360-13-Early-2019-Hackintosh and [tonymacx86](https://www.tonymacx86.com/threads/guide-hp-spectre-x360-13-ap0037tu-late-2018.295518/) first ! This repo learns a lot from them.

> If your trackpad doesn't work suddenly, hit `prt sc` key may help

My specs:

* CPU: i7-8565U
* GPU: UHD620
* Screen: 4k internal screen

Two Versions:
* Catalina Clover：based on clover，supports macOS Catalina 10.15.7
* Big Sur Opencore：based on opencore，supports macOS Big Sur 11.2.
  * **The external 4k screen may not works at 60hz with unusable flash**
  * Not sure whether others will meet this or not: After copying the EFI to internal SSD EFI partition, it will stuck at [EB|#LOG:EXITBS:START]. However, it works fine if booting from USB EFI partition.
  
> **For Big Sur**: When you boot the system with an external monitor, the internal 4k screen doesn't look like 60hz -- It may behave like around 40hz(Though the system reports as 60hz screen). It could be solved by booting without external monitor or re-pluging the external monitor.

> **For Big Sur**: When you unplug the external screen for the first time after booting, the internal screen may turn into black. You should close the lid and unplug the external screen after the internal screen stops working. Then open the lid, and the internal screen should work fine. The operation is only needed for the first time, unless you reboot the system.


------

Patch your DSDT as shown in [tonymacx86](https://www.tonymacx86.com/threads/guide-hp-spectre-x360-13-ap0037tu-late-2018.295518/):

* [bat]HP_Spectre_x360_apxxxx.txt ( Catalina Clover + Big Sur Opencore)
* [I2C]HP_Spectre_x360_apxxxx.txt ( Big Sur Opencore ONLY ) ==> This will fix your trackpad with opencore. Not needed with clover


------

### Improve the performance by undervoltage !

You could notice your CPU frequency drops to 600mhz when using an application that consumes GPU heavily (such as Epic Game Launcher), or you get lower mark with GeekBench5 when comparing to Windows 10. Then [voltageshfit](https://github.com/sicreative/VoltageShift) is all your need !

According to my insufficient test, `sudo ./voltageshift --damage offset -80 -500 -80` works good ! (CPU, GPU, and CPU Cache). It is possible to set CPU and CPU Cache to -125, but the computer has the risk of overheating shutdown since the fan cannot work at full speed in time.

* Before voltageshfit, GeekBench5 gives me about 900~1000 single core, 2900~3000 multi-core; CPU runs at 600mhz when opening Epic Game Launcher
* After voltageshfit, GeekBench5 gives me about 900-1000 single core, 3300~3400 multi-core; CPU works normally when opening Epic Game Launcher

> Please spend more time on adjusting the parameters ! It is important to make sure the values cannot give you an unstable system :)

My radical parameters: `sudo ./voltageshift --damage offset -100 -200 -100`, and the GeekBench5 score below:

<img src="./Screenshot/geekbench5_result.png" width="800" alt="my_geekbench5"/><br/>

------

### More thoughts about the performance

There are still more problems with the performance, especially when using an application consuming GPU heavily(Games). Though undervoltage could alleviate it, 800mhz CPU still occurs when CPU package power meets 15w more than 20 seconds(Games again. I even cannot play MTGA smoothly). I guess 15w is the main reason since it works well before CPU package power drops below 15w (only for several seconds), and CPU frequency drops after CPU package power is limited below 15w. So I think 20w TDP could solve this problem.

However, I have noticed that the TDP is 15w even if the PL1/PL2 are set to 20w/30w (PL1/PL2 are the default values). 

When in windows, the TDP are set to 20w on performance mode and 7w on cooling mode (HP Command Center does the trick, and all the values could be seen in XTU) while the PL1/PL2 keep 20w/30w.

I guess if we want to improve the performance, we need to figure out how the HP Command Center works :)

-----

### For 20w TDP

I have patched the latest version voltageshift: https://github.com/SeptemberHX/VoltageShift/releases

> make sure `sudo chown -R root:wheel VoltageShift.kext` after downloading the binary files

According to https://github.com/buliaoyin/VoltageShift , `rdmem` and `wrmem` are implemented which means we can change **MCHBAR** values to reach 20w TDP.

Below is my choice:

```shell
sudo ./voltageshift --damage offset -115 -200 -115       # undervoltage
sudo ./voltageshift write 0x610 0x42814000dd80c8         # set LP1/LP2 to 25w/40w.  Actuallly 20w/30w are enough since TDP will never exceed 20w
sudo ./voltageshift wrmem 0xfed159a0 0x42814000dd80c8    # set 25w/40w in MCHBAR    However, I don't want to do the calculation to get he HEX values :)
```

**Need to be executed after each booting**

Actually this cannot improve the CPU performance. Geekbench 5 doesn't give better results. However, it could solve <1000mhz CPU frequency when playing games (or other heavy gpu usage applications) :)

> You can use `boost.sh` to improve the performance

Then Intel Power Gadget as below:

<img src="./Screenshot/intel_power_gadget.png" width="400" alt="intel_power_gadget.png"/><br/>

### References

* https://github.com/erpalma/throttled for relaxing tdp on Linux which lets me know it is possible to do that on macOS
* https://github.com/sicreative/VoltageShift for undervoltage tools
* https://github.com/buliaoyin/VoltageShift for changing values in MCHBAR
* https://github.com/daliansky/XiaoMi-Pro-Hackintosh/issues/174 for more details about the tdp and 800mhz cpu frequency
* https://github.com/jpuxdev/HP-Spectre-X360-13-Early-2019-Hackintosh for Big Sur compatibility
* https://www.tonymacx86.com/threads/guide-hp-spectre-x360-13-ap0037tu-late-2018.295518 for Opencore guide


