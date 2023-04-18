## Qubes OS Themeing (Rice)

Qubes OS is known to be secure, power-hungry and ugly. I cant change the first two, however I can fix the last of those. So lets get started.

You need:
- Fedora based VMs (sowwy debian users. Feel free to PR a solution for your systems tho <3)
- This repo. Download it however you prefer
- A hate towards the default styles
- A little bit of patience (since themeing is done on user-level, and you have to do it for all qubes. I recommend putting those files on a drive and quickly attaching it to wherever, to just run the script.)


## What it changes:

This script changes basically everything. GTK theme, Font, Icons, gets rid of useless nautilus and replaces it with thunar, adds qvm-copy to Thunar, rices your terminal to use zsh, oh-my-zsh & powerlevel10k (default config by me).

All this is done by the batch script in a single go. Run it with the `--help` flag to get information on required arguments. The script itself does a very basic check for templates (just checks for dashes inside name, please adjust for your system in line 67). If its inside a template, it will install all dependencies, and then theme it. AppVMs are just being themed, all dependencies are expected to exist, so make sure you run it on a template first, or manually install the requirements.

Feel free to change anything you dont like and fork this repo. I just hate to see how nobody shares auto-setups for ricing. Its a shame.


## Dom0

This script can also rice your Dom0. It will check if it is inside dom0, and use the appropriate qubes-dom0-update command instead of dnf for the dependencies, and use a [local copy of files](https://github.com/ClaraCrazy/qubes-docs/customization/local-dom0) for zsh git-clone.

Furthermore, it will, if explicitely selected, also install KDE on dom0. But wait, theres more! ... [ROFI](https://github.com/davatorium/rofi), a wonderful little AppMenu, will also be installed. Dont want it, comment out / remove Lines `87` & `202` - `206`. Do like it? Go to your hotkey settings, and add a hotkey with the command `rofi -show drun`. Wont auto-do that. Nightmares lol


## Should I trust this?

No. Read the source. If you dont understand it, ask someone to explain it (not me). If you dont trust the themes, download them yourself and replace them. They are fully stock besides some name shortening bc I was lazy (Numix-black-yellow → Numix-YELLOW for example)


## Pics or it didnt happen

![2023-04-18-050335](https://user-images.githubusercontent.com/55334727/232661598-3ddd4b07-9c78-4088-a892-41f8dadf0a5f.png)
![2023-04-18-050423](https://user-images.githubusercontent.com/55334727/232661476-b00a15a1-63b4-401c-8009-10744732a52b.png)
