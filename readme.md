# Hackintosh for HP Spectre-X360-13 late 2018

Please check https://github.com/jpuxdev/HP-Spectre-X360-13-Early-2019-Hackintosh first ! This repo learns a lot from it.

> If your trackpad doesn't work suddenly, hit `prt sc` key may help

两个版本：
* Catalina Clover：基于 clover，支持 macOS 10.15.7 基本完美
* Big Sur Opencore：基于 opencore，支持 Big Sur 11.2，4k 外接屏 60hz 可能无法使用

Two Versions:
* Catalina Clover：based on clover，supports macOS Catalina 10.15.7
* Big Sur Opencore：based on opencore，supports macOS Big Sur 11.2.
  * **The external 4k screen may not works at 60hz with unusable flash**
  * Not sure whether others will meet this or not: After copying the EFI to internal SSD EFI partition, it will stuck at [EB|#LOG:EXITBS:START]. However, it works fine if booting from USB EFI partition.


------

Patch your DSDT as shown in [tonymacx86](https://www.tonymacx86.com/threads/guide-hp-spectre-x360-13-ap0037tu-late-2018.295518/):

* [bat]HP_Spectre_x360_apxxxx.txt ( Catalina Clover + Big Sur Opencore)
* [I2C]HP_Spectre_x360_apxxxx.txt ( Big Sur Opencore ONLY ) ==> This will fix your trackpad with opencore. Not needed with clover
