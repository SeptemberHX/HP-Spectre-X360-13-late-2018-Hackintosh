# Hackintosh for HP Spectre-X360-13 late 2018

两个版本：
* Catalina Clover：基于 clover，支持 macOS 10.15.7 基本完美
* Big Sur Opencore：基于 opencore，支持 Big Sur 11.2，目前触摸板无法使用，笔记本内屏只有40hz

Two Versions:
* Catalina Clover：based on clover，supports macOS Catalina 10.15.7
* Big Sur Opencore：based on opencore，supports macOS Big Sur 11.2. **The internal 4k screen only works at 40hz**


------

Patch your DSDT as shown in [tonymacx86](https://www.tonymacx86.com/threads/guide-hp-spectre-x360-13-ap0037tu-late-2018.295518/):

* [bat]HP_Spectre_x360_apxxxx.txt ( Catalina Clover + Big Sur Opencore)
* [I2C]HP_Spectre_x360_apxxxx.txt ( Big Sur Opencore ONLY ) ==> This will fix your trackpad with opencore. Not needed with clover


------

### Improve the performance by undervoltage !

You could notice your CPU frequency drops to 600mhz when using an application that consumes GPU heavily (such as Epic Game Launcher), or you get lower mark with GeekBench5 when comparing to Windows 10. Then [voltageshfit](https://github.com/sicreative/VoltageShift) is all your need !

According to my insufficient test, `sudo ./voltageshift --damage offset -100 -100 -100` works good ! (CPU, GPU, and CPU Cache). It is possible to set CPU and CPU Cache to -125, but the computer has the risk of overheating shutdown since the fan cannot work at full speed in time.

* Before voltageshfit, GeekBench5 gives me about 900~1000 single core, 2900~3000 multi-core; CPU runs at 600mhz when opening Epic Game Launcher
* After voltageshfit, GeekBench5 gives me about 900-1000 single core, 3300~3400 multi-core; CPU works normally when opening Epic Game Launcher

> Please spend more time on adjusting the parameters ! It is important to make sure the values cannot give you an unstable system :)
