
<p align="center">
<img src="https://user-images.githubusercontent.com/55334727/233874364-ba5a32d3-2ad8-4697-8ddc-24eae0b30ba5.png">

<h3 align="center">Qubes OS Documentation, written with :blue_heart: by a fellow user, to help all those that struggle, or simply need some inspiration</h3>

<img style="margin: 10px" src="https://user-images.githubusercontent.com/73097560/115834477-dbab4500-a447-11eb-908a-139a6edaec5c.gif" height="25" />
</p>


I have spent the past couple of years with Qubes OS. Some days I used it less, some more. Now its my Main operating system, and since I dont really like how sparse the community-driven docs are on the far far range of the internet, I wrote my own and collected some useful links for you to look at.

<br>

<details open>
<summary>⁉️ First off, a little Q&A about Qubes, as its rather niche.</summary>

**Q:** *"I heard it just runs everything in a VM?"*

>**A:** Yes, and no. Imagine Qubes OS like VirtualBox, VMWare or KVM. Its more of a manager / hypervisor for everything inside of it. Qubes doesnt run Firefox inside a VM itself. Qubes runs Operating Systems, like fedora, debian, whonix, arch, windows 10, macOS... and inside those you have your Firefox.

----

**Q:** *"So, what purpose is there to use it?"*

>**A:** Qubes OS allows you to securely compartmentalize your digital life, and unlike things like VirtualBox it does so in a seemless way. You dont see 200 VM windows open switching from OS to OS. No, you just see your application windows, have a nice desktop etc. Just like you are used to on Windows, Mac or Linux. Qubes allows you to do things that other operating systems simply cant

----

**Q:** *"Should I use Qubes?"*

>**A:** It depends. You should have great understanding of Linux to use Qubes. Most of your "Qubes" / VMs will most likely run Fedora or Debian (thats the defaults) so knowing your way around in the shell is important. Its also important to know that if you want to game on Qubes OS, you will need some patience and a dedicated GPU for it. Usually I recommend qubes to everyone that wants more security, already loves organizing / compartmentalizing their System etc.

</details>
<img style="margin: 10px" src="https://user-images.githubusercontent.com/73097560/115834477-dbab4500-a447-11eb-908a-139a6edaec5c.gif" height="25" /><br>

#### Now, lets look at some documents. The first batch of those will be written by me, detailing things I made myself / found throughout my time of using Qubes OS. 
> **Note** <br><br>
> Keep in mind that these documents are mostly for advanced usage. Furthermore, they should not be used as your sole source for running Qubes. Always make sure to read the [official documentation](https://qubes-os.org/doc) as well

<br>

<details open>
<summary> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Qubes_OS_Logo.svg/1200px-Qubes_OS_Logo.svg.png" width="16">ubes Docs I wrote:</summary>

- [Sys-mitm, a man-in-the-midle qube for traffic analysis](https://github.com/ClaraCrazy/qubes-docs/blob/main/sys-mitm.md)
- [Qubes OS recovery docs](https://github.com/ClaraCrazy/qubes-docs/blob/main/recovery.md)
- [Qubes OS Customization](https://github.com/ClaraCrazy/qubes-docs/tree/main/customization)
<br><br>

- [Modified Scripts, because sometimes originals just dont cut it](https://github.com/ClaraCrazy/qubes-docs/blob/main/modified-things/readme.md)
- [My entire journey with QubesOS, for those that actually care](https://github.com/ClaraCrazy/qubes-docs/blob/main/journey.md)
</details>

----
<br>

#### Also, I wouldnt be where I am with Qubes OS without these wonderful documents of the community. Read them if you are new to qubes, its worth it!:<br><br>

<details open>
<summary> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Qubes_OS_Logo.svg/1200px-Qubes_OS_Logo.svg.png" width="16">ubes Docs for initial setup:</summary>


- [Sys-usb Qube](https://www.qubes-os.org/doc/usb-qubes/#how-to-create-a-usb-qube-for-use-with-a-usb-keyboard)
- [Sys-vpn Qube using Mullvad](https://mullvad.net/help/qubes-os-4-and-mullvad-vpn/)
- [Custom App entries for the Q Menu](https://www.qubes-os.org/doc/app-menu-shortcut-troubleshooting/)
- [Systemwide dark-mode (XFCE)](https://forum.qubes-os.org/t/guide-xfce-global-dark-mode-in-qubes-4-0-4-1/10757)
- [U2F app](https://github.com/QubesOS/qubes-app-u2f)
- [Auto-shutdown for qubes](https://forum.qubes-os.org/t/auto-shutdown-vm-when-app-is-closed/8574/2) | [More of that](https://github.com/QubesOS/qubes-app-shutdown-idle) (nice for banking qube etc.)

</details>

----
<br>

<details open>
<summary> 🎮 For the gamers:</summary>

- [Secondary Storage for VM](https://www.qubes-os.org/doc/secondary-storage/)
- [GPU Passthrough docs](https://forum.qubes-os.org/t/create-a-gaming-hvm/19000) | psst.. on that 3.5gb patch, replace `_` with `-` for qube naming consistency
- [Creating the HVM](https://www.qubes-os.org/doc/standalones-and-hvms/#creating-an-hvm)

</details>

----
<br>

<details open>
<summary> 🌐 Community Scripts I use (handle with caution):</summary>

- [Qubes-Template-Builder](https://github.com/QubesOS/qubes-builderv2/) & [Template-Builder-Example](https://forum.qubes-os.org/t/archlinux-minimal-template/19052)
- [Split-SSH setup for secure usage](https://forum.qubes-os.org/t/split-ssh/19060)
- [qvm-screenshot-tool](https://github.com/evadogstar/qvm-screenshot-tool)
- [Beautiful Conky](https://github.com/3hhh/qubes-conky) (Requires some adjustments, have fun)
- [Auto-attach devices to specific qube](https://forum.qubes-os.org/t/usb-device-auto-attach-to-qube/5977)

</details>

----
<br>

<details open>
<summary> 🥇 Noteworthy mentions (handle with caution):</summary>



- [qvm-create-windows-qube](https://github.com/elliotkillick/qvm-create-windows-qube)
- [qvm-wallpaper-tool](https://github.com/evadogstar/qvm-wallpaper-tool)
- [qvm-open-in-another-vm](https://github.com/Rudd-O/qvm-open-in-another-vm)
- [Remote Dom0 VNC](https://forum.qubes-os.org/t/remote-qubes-user-testing-running-qubes-in-the-browser/13817)

----
<br>

<details open>
<summary> <img src="https://cdn-icons-png.flaticon.com/512/152/152529.png" width="16"> Misc. documents and notes:</summary>

- [In-place Template updates](https://www.qubes-os.org/doc/templates/fedora/in-place-upgrade/#detailed-instructions-for-standard-fedora-templates)
- [Understanding "-dm" sys-qubes](https://wiki.xenproject.org/wiki/Device_Model_Stub_Domains)
<br>

- Dont use "intelligent" panel hiding on xfce.. use "always"
- I might be wrong, but it seems like the systemd call for sys-usb (and possibly other qubes) is incorrect, as systemd service files do not point to /rw/config/rc.local. Go fix that if you rely on it
- `sudo qubes-dom0-update packagename` - Install a package to dom0
- `qvm-run --pass-io qube 'cat /path/to/whatever.ext' > /home/Username/Downloads/whatever.ext` - Copy file to Dom0 **NOT RECOMMENDED**

</details>

----
<br>

### ❤️ Support me

<!--
Pwease support me >.<
-->  

<p>Since I work full-time on open-source projects spread across my organizations, my only source of income is donations from people like you that use & appreciate my stuff. So, if you can spare a dollar or two, I would really appreciate that. All the money goes towards paying rent, essentials like food, drinks etc, and most importantly it will be used to fuel my cookie addiction🍪<br></p>

- **[Patreon](https://patreon.com/crazyco) (Fee: 8%\*)**: ❤️ Account needed, subscription with perks
- **[ko-fi](https://ko-fi.com/crazyco) (Fee: 2%\*)**: No account needed, subscription or one-time donation
- **[Wire-transfer](https://bunq.me/ClaraK) (Fee: 0%\*)**: No account needed, one-time donation
- **[Paypal](https://paypal.me/ClaraCrazy) (Fee: 2%\*)**: Account needed, one-time donation
- **Monero (Fee: ~2.5%\*)**: `41kyWeeoVdK4quzQ4M9ikVGs6tCQCLfdx8jLExTNsAu2SF1QAyDqRdjfGM6EL8L9NpXwt89HJeAoGf1aoArk7nDr4AMMV4T`<br>

\* Fee is calculated by how much I will lose when cashing out<br>
\*\* Please make sure to select *Friends and Family*<br><br>
**Thanks for all your support <3**
