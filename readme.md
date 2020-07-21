# Hackintosh Clover EFI for HP Spectre X360 13 late 2018 (Chinese Model)

* CPU: Core ™ i7-8565U
* iGPU: Intel Graphics UHD 620
* RAM: 16GB
* Storage: **NVMe Samsung PM981 512GB** is impossible for now. Please replacing it with other disk.
* USB: USB3.1 Gen2 x 1 Thunderbolt 3 x 2
* WiFi: Intel Wireless AC 9560
* Bluetooth: VID 8087 PID 0AAA USB
* Trackpad: SYNA329A
* Touchpad: ELAN2514

> I created the EFI based on the EFI provided by jessi-mj on [olarila](https://www.olarila.com/topic/6636-mojave-10145-on-hp-spectre-x360-with-i7-8565u/) and instructions from Kusaanko on [tonymacx86](https://www.tonymacx86.com/threads/guide-hp-spectre-x360-13-ap0037tu-late-2018.295518/).
> Thanks for their working !!

For more details in creating the EFI, following the link above.

> For different model, please follow [tonymacx86](https://www.tonymacx86.com/threads/guide-hp-spectre-x360-13-ap0037tu-late-2018.295518/) to generate your own DSDT.aml, apply patches and put it back to EFI.

### What works?
Keyboard
Trackpad(I2C)
Touchpad(I2C)
Touch pen
Built-in Speaker
Built-in microphone
Headphone
Graphics acceleration
Thunderbolt 3
USB3.1 Gen2
Connection of external display for conversion from Type-C to HDMI
Screen brightness adjustment
The remaining battery capacity (The frequency of updating the battery level is unstable.)
Wi-Fi(Built-in intel chip)
Siri
microSD card reader
Sleep
The screen return after opening the lid
App Store
iCloud
macOS update

### What doesn't work?
Bluetooth(It can connect but cannot communicate.)
Fingerprint authentication sensor
Camera (it may be used with some software because it is recognized as a USB camera)
iMessage
FaceTime

------

The touchpad seems not work sometimes, just update VoodooI2C to the latest version with Hackintool. That should work.
