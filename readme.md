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
