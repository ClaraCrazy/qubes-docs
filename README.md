# qubes-docs
My list of Qubes OS related documents

I have spent quite a while to write some documents detailing things I encountered while using qubes. This list will be updated whenever I encounter anything new.

- [Sys-mitm, a man-in-the-midle qube for traffic analysis](https://github.com/ClaraCrazy/qubes-docs/blob/main/sys-mitm.md)
- [Qubes OS recovery docs](https://github.com/ClaraCrazy/qubes-docs/blob/main/recovery.md)
- [Qubes OS Customization](https://github.com/ClaraCrazy/qubes-docs/tree/main/customization)
<br><br>

- [My entire journey with QubesOS, for those that actually care](https://github.com/ClaraCrazy/qubes-docs/blob/main/journey.md)

-----
<br><br>
Also, I wouldnt be where I am with Qubes OS without these wonderful documents of the community:

### Qubes Docs for initial setup:

- [Sys-usb Qube](https://www.qubes-os.org/doc/usb-qubes/#how-to-create-a-usb-qube-for-use-with-a-usb-keyboard)
- [Sys-vpn Qube using Mullvad](https://mullvad.net/help/qubes-os-4-and-mullvad-vpn/)
- [Custom App entries for the Q Menu](https://www.qubes-os.org/doc/app-menu-shortcut-troubleshooting/)
- [Systemwide dark-mode (XFCE)](https://forum.qubes-os.org/t/guide-xfce-global-dark-mode-in-qubes-4-0-4-1/10757)
- [U2F app](https://github.com/QubesOS/qubes-app-u2f)
- [Auto-shutdown for qubes](https://forum.qubes-os.org/t/auto-shutdown-vm-when-app-is-closed/8574/2) | [More of that](https://github.com/QubesOS/qubes-app-shutdown-idle) (nice for banking qube etc.)

-----

### Other Qubes Scripts / links that helped me get to where I am

- [Qubes-Template-Builder](https://github.com/Qubes-Community/Contents/blob/master/docs/building/building-archlinux-template.md)
- [In-place Template updates](https://www.qubes-os.org/doc/templates/fedora/in-place-upgrade/#detailed-instructions-for-standard-fedora-templates)
- [Split-SSH setup for secure usage](https://github.com/Qubes-Community/Contents/blob/master/docs/configuration/split-ssh.md)
<br><br>
- [Understanding "-dm" sys-qubes](https://wiki.xenproject.org/wiki/Device_Model_Stub_Domains)

-----

### For a Gaming HVM:

- [Secondary Storage for VM](https://www.qubes-os.org/doc/secondary-storage/)
- [GPU Passthrough docs](https://github.com/Qubes-Community/Contents/blob/master/docs/customization/gaming-hvm.md) | psst.. on that 3.5gb patch, replace `_` with `-` for qube naming consistency
- [Creating the HVM](https://www.qubes-os.org/doc/standalones-and-hvms/#creating-an-hvm)

-----

### Community Scripts I use (handle with caution):

- [qvm-screenshot-tool](https://github.com/evadogstar/qvm-screenshot-tool)
- [Beautiful Conky](https://github.com/3hhh/qubes-conky) (Requires some adjustments, have fun)
- [Auto-attach devices to specific qube](https://forum.qubes-os.org/t/usb-device-auto-attach-to-qube/5977)

-----

### Noteworthy mentions (handle with caution):

- [qvm-create-windows-qube](https://github.com/elliotkillick/qvm-create-windows-qube)
- [qvm-wallpaper-tool](https://github.com/evadogstar/qvm-wallpaper-tool)
- [qvm-open-in-another-vm](https://github.com/Rudd-O/qvm-open-in-another-vm)
- [Remote Dom0 VNC](https://forum.qubes-os.org/t/remote-qubes-user-testing-running-qubes-in-the-browser/13817)

-----

### Misc notes:
- Dont use "intelligent" panel hiding on xfce.. use "always"
- `sudo qubes-dom0-update packagename` - Install a package to dom0
- `qvm-run --pass-io qube 'cat /path/to/whatever.ext' > /home/Username/Downloads/whatever.ext` - Copy file to Dom0 **NOT RECOMMENDED**
