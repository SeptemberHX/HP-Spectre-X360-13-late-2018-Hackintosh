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

------

以下是从 [tonymacx86](https://www.tonymacx86.com/threads/guide-hp-spectre-x360-13-ap0037tu-late-2018.295518/) 引用来的 DSDT 补丁方法，方便查找和操作：

**提取自己电脑的 DSDT 文件，这个很重要，我身边的两台同型号，同配置的电脑，出现了 DSDT 不一致导致的无法正常引导的情况。**

分别打上三个补丁：
* [bat]HP_Spectre_x360_apxxxx.txt
* [I2C]HP_Spectre_x360_apxxxx.txt
* [brightness_key]HP_Spectre_x360_apxxxx.txt

然后 DSDT 里搜索 `PS2K`，并将 `PS2K {......}` 替换为以下内容：
```
                Device (PS2K) //Keyboard
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CID, EisaId ("PNP030B"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (IOST, 0x0400))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            FixedIO (
                                0x0060,             // Address
                                0x01,               // Length
                                )
                            FixedIO (
                                0x0064,             // Address
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {1}
                        }
                        EndDependentFn ()
                    })
                    Method (_PSW, 1, NotSerialized)
                    {
                        Store (Arg0, KBFG)
                    }
                }
                Scope (\)
                {
                    Name (KBFG, Zero)
                }
                Method (PS2K._PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x1D, 0x04))
                }
                Device (PS2M) //Mouse
                {
                    Name (_HID, EisaId ("PNP0F03"))
                    Name (_CID, EisaId ("PNP0F13"))
                    Method (_STA, 0, NotSerialized)
                    {
                        If (And (IOST, 0x4000))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                    Name (CRS1, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Name (CRS2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {12}
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        If (And (IOST, 0x0400))
                        {
                            Return (CRS1)
                        }
                        Else
                        {
                            Return (CRS2)
                        }
                    }
                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IRQNoFlags ()
                                {12}
                        }
                        EndDependentFn ()
                    })
                    Method (_PSW, 1, NotSerialized)
                    {
                        Store (Arg0, MSFG)
                    }
                }
                Scope (\)
                {
                    Name (MSFG, Zero)
                }
                Method (PS2M._PRW, 0, NotSerialized)
                {
                    Return (GPRW (0x1D, 0x04))
                }
```
