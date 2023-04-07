## My Journey with Qubes OS:

I wanted to take the time and document my journey with Qubes, to give others an insight on this very unusual operating system, why I use it, how I use it, and how it impacted my workflow. I think thats something that isnt really done enough. Most people are, understandably, very quiet about their Qubes usage for one reason or another.

-----

- 2018-2020:

So, the journey began around 2018, when the world wasnt covid-plagued yet. I'm not sure anymore how exactly it went down, but eventually I just found myself browsing for a more secure alternative to Windows / Linux. I found Qubes, read about the [Nitropad](https://shop.nitrokey.com/shop/product/nitropad-x230-67) being [certified Hardware](https://www.qubes-os.org/news/2020/03/04/nitropad-x230-qubes-certification/) and eventually I just ordered one. It arrived a few days later and after being confused for a solid hour I slowly understood how this OS works. Mind you, documentation wasnt that good back then. It was there, no doubts, but it lacked a lot of info IMO.

So, with my nitropad I explored TOR for the first time in years, found some random-chat sites, snooped around archival sites, and just messed around. Eventually I built some Windows (10?) VM to test some malware, as I am somewhat known in that scene for writing my own code and deobfuscating the stuff of others. Here are some pics I found of that time:

<p align="center">
  <img alt="My System:" src="https://user-images.githubusercontent.com/55334727/230639791-6070e9bf-7329-4373-b803-8cb1eed67e86.png" width="45%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Messing with ransomware" src="https://user-images.githubusercontent.com/55334727/230640468-0e92bc7c-953d-46a1-b1ba-f10f734aac16.png" width="45%">
</p>

Despite all that, Qubes was not my main OS at that time, I never even considered it. While yes, I have been running the Qubes OS discord since like day 2, and I've been very vocal about Qubes, it really was just a novelty to me. Not a daily driver.

-----

- Covid days:

During covid I had a lot of free time to do very stupid things, and as some might know, I did. I made a name for myself for all the wrong reasons, and using Windows for my activities got increasingly dangerous. More and more I thought about switching to Qubes fully, but the lack of GPU-acceleration always stopped me from pulling through. So, I continued to run Qubes on the tiny Nitropad, using it on-and-off whenever needed. I met some really cool people throughout the pandemic that also used qubes, and learned a lot from them. Custom community scripts really changed the game for me. Most of my issues were solved with them. All in all, nothing really changed on my opinion towards running it as a main OS tho.

-----

- 2023:

After a call with a friend I randomly decided to give it a shot. I made a copy of all important files, and flashed Qubes onto my main PC. I quickly ran into two issues.

1. XFCE was not happy with my displays
2. I was not happy with XFCE


The solution to both was obvious, and a friend helped me with it. I switched to KDE, after another hour of troubleshooting my Screen issues were solved, KDE looked beautiful and Qubes was up and running.

<img src="https://user-images.githubusercontent.com/55334727/230643732-1030bac1-b14e-4e9d-b567-18d2d2d87dfe.png" align="right" width="200px"/>
Throughout the next couple of weeks I made a fatal mistake. I installed crap on my Template. I totally forgot about how all of this even worked and just blindly installed all my stuff on there. I mean, its kinda how you do it, but also not at all. I realized this once I installed a package that would auto-start and absolutely trigger me with that. Sooo.. I made a new template, and kept the old one as "template-untrusted". That way I could use (some of) these packages in a qube where I need them, and have a clean slate for the other ones. 
<br><br>
Talking about VMs, a lot of people arent sure how to structure theirs, so lets talk about my setup:

- The colors:
  - Figuring out the colors you want to use is the first important thing. <br><br>Will you base it on its apps running in each (e.g. discord = blue, vscode = purple, browser = orange), or do you want to make some kind of security-based scheme like I did? Red being the most dangerous, while green is fine to use (we'll talk about why Win10 is green later). Templates are grey, almost "greyed out" as in you cant touch them, because you shouldnt. Black is above red in my case. Be very very careful, dont mess things up, not because it will harm your system, but because it will harm you.
  
- What VMs to use:
  - What do you need? Debian, Fedora, Arch, Ubuntu even? Thats a good question, and I'm glad you asked. What you really need is a distro you feel comfortable with. It doesnt matter what it is. Dont worry about it. You can harden almost any qube and at the end of the day its important that you are happy with using it. I chose fedora because I prefer it over Debian-based distros, and am not yet unhinged enough to run Arch. 

  <br>

  With a fedora template I built most of my qubes. <code>Media</code> for Music, Youtube & Discord. <code>Work</code> for my business, <code>Banking</code> should be obvious, and <code>Coding</code> is for all my projects you can find on github.
  <br>
  You might notice two other qubes that peak your interest: <code>Template builder</code> and <code>gpu_win10</code>. 

    - Template-builder is my dedicated Qube for building Qubes OS templates, and in theory an entire ISO. 
    - gpu_win10 is my gaming Qube. 32GB of ram, a 3060 using [passthrough](https://github.com/Qubes-Community/Contents/blob/master/docs/customization/gaming-hvm.md) and 8 Cores assigned to it. It runs games very well, at least the ones that dont do VM detection. Currently working on that, and will post a guide once I figured it out! As to why this VM has the green "trusted" color? Well, its windows. It has shit integration with qubes and needs different hardware to even run. Its incompatibility is a great factor. Another one is that it sits on its own disk. The used GPU is not just excluded from qubes, but also from xen via grub config, and I'm also only using it for games. Nothing else

  Last but not least, theres <code>sys-vpn</code> & <code>sys-mitm</code>. Sys-vpn is another net-qube using Mullvad, and [sys-mitm](https://github.com/ClaraCrazy/qubes-docs/blob/main/sys-mitm.md) is a qube for man-in-the-middle usage to analyze traffic from untrusted qubes / apps.
  
- Global settings:
  - I wasnt sure what the right settings would be, but eventually I settled on testing releases for all three Source repositories. This comes with some risks ofc, especially the community repos, but I think I will be fine.

-----

<br><br>

- So, where are we now? We are right here:

![preview](https://user-images.githubusercontent.com/55334727/230662490-1c2dca65-da6e-4d3d-9beb-73c5b24a7407.png)

Running qubes as my main Operating system, being very happy with it. The compartmentalization has allowed me to work with a lot less worry that anything will be compromised. My keys are in a vault, my workflows are separated from all the dangerous things, Google has a harder time to track me around the web, and what I never thought about that does make sense tho; Its a lot more clean and organized now. Back then finding a file on my system was painful. Now its all nice and sorted, thanks to qubes. 

If you got any questions, feel free to ask me. My email is linked on github, and my Discord tag is ClaraCrazy#6969

<br><br>
Cheers


<br clear="right"/>
