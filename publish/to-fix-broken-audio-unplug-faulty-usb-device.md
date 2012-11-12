Title: To fix broken audio, unplug faulty USB device.
Date: 2010-01-19 09:08:02
Tags: computing

How weird is this, just recently when I started up my computer lots of stuff was broken, no audio (and /proc/asound/cards was empty, normally it has "0 [Intel          ]: HDA-Intel - HDA Intel\nHDA Intel at 0xfa100000 irq 22"), libsensors weren't reporting any values (eg. no CPU temp reported), eth0 dissapeared from NetworkManager, and probably a host of other things that I didn't notice. Restarting didn't fix it.

Well long story short, it turns out that everything magically fixed when I unplugged a USB hard drive that was plugged in. I had seen a lot of concerning messages sent to /var/log/messages from the kernel about it,

Jan 19 09:45:00 host kernel: [  564.100026] usb 1-3: reset high speed USB device using ehci_hcd and address 2
Jan 19 09:45:00 host kernel: [  564.237716] sd 8:0:0:0: [sdd] Unhandled error code
Jan 19 09:45:00 host kernel: [  564.237719] sd 8:0:0:0: [sdd] Result: hostbyte=DID_ABORT driverbyte=DRIVER_OK

that repeated every so often, but I never thought that a dodgy USB device would break the kernel from doing some of its job.