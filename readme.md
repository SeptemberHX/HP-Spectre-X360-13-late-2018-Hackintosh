# Hackintosh Clover EFI for HP Spectre X360 13 late 2018 (Chinese Model)

我使用的 macOS 版本：10.15.5 和 10.15.6

* CPU: Core ™ i7-8565U
* iGPU: Intel Graphics UHD 620
* RAM: 16GB
* Storage: **NVMe Samsung PM981 512GB** is impossible for now. Please replacing it with other disk. (国内好像都是东芝的？我身边两台都是东芝的，可以直接装)
* USB: USB3.1 Gen2 x 1 Thunderbolt 3 x 2
* WiFi: Intel Wireless AC 9560 （itwlm可以直接驱动，无需换网卡或者外接USB网卡，但是不支持 handoff 这些）
* Bluetooth: VID 8087 PID 0AAA USB （也能直接驱动，有补丁）
* Trackpad: SYNA329A
* Touchpad: ELAN2514

> I created the EFI based on the EFI provided by jessi-mj on [olarila](https://www.olarila.com/topic/6636-mojave-10145-on-hp-spectre-x360-with-i7-8565u/) and instructions from Kusaanko on [tonymacx86](https://www.tonymacx86.com/threads/guide-hp-spectre-x360-13-ap0037tu-late-2018.295518/).
> Thanks for their working !!

> DO NOT use the DSDT.aml in this repo. Follow  [tonymacx86](https://www.tonymacx86.com/threads/guide-hp-spectre-x360-13-ap0037tu-late-2018.295518/) to create your own DSDT.aml

For more details in creating the EFI, following the link above.

> For different model, please follow [tonymacx86](https://www.tonymacx86.com/threads/guide-hp-spectre-x360-13-ap0037tu-late-2018.295518/) to generate your own DSDT.aml, apply patches and put it back to EFI.

### What works?
* Keyboard
* Trackpad(I2C)
* Touchpad(I2C)
* Touch pen
* Built-in Speaker
* Built-in microphone
* Headphone
* Graphics acceleration
* Thunderbolt 3
* USB3.1 Gen2
* Connection of external display for conversion from Type-C to HDMI
* Screen brightness adjustment
* The remaining battery capacity (The frequency of updating the battery level is unstable.)
* Wi-Fi(Built-in intel chip)
* Siri
* ~~microSD card reader~~
* Sleep
* The screen return after opening the lid
* App Store
* iCloud
* macOS update

### What doesn't work?
* Bluetooth(It can connect but cannot communicate.)我试了，好使，不过不是特别稳定
* Fingerprint authentication sensor
* Camera (it may be used with some software because it is recognized as a USB camera) 微信视频貌似都正常
* iMessage
* FaceTime

------

The touchpad seems not work during installing. It should work after rebooting into system.
