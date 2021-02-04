# Hackintosh for HP Spectre-X360-13 late 2018

两个版本：
* Catalina Clover：基于 clover，支持 macOS 10.15.7 基本完美
* Big Sur Opencore：基于 opencore，支持 Big Sur 11.2，目前触摸板无法使用，笔记本内屏只有40hz

Two Versions:
* Catalina Clover：based on clover，supports macOS Catalina 10.15.7
* Big Sur Opencore：based on opencore，supports macOS Big Sur 11.2. Touchpad doesn't work, and the internal 4k screen only works at 40hz


------

以下是从 [tonymacx86](https://www.tonymacx86.com/threads/guide-hp-spectre-x360-13-ap0037tu-late-2018.295518/) 引用来的 DSDT 补丁方法，方便查找和操作：

**提取自己电脑的 DSDT 文件，这个很重要，我身边的两台同型号，同配置的电脑，出现了 DSDT 不一致导致的无法正常引导的情况。**

* [bat]HP_Spectre_x360_apxxxx.txt
