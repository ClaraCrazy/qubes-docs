# Modified Tools, because originals sometimes suck

Here is a list of tools that I modified / found modifications for, because I could not stand the originals. <br><br>

- [Fixed deepin-screenshot](https://github.com/JojiiOfficial/deepin-screenshot):
  - Why?
    - Auto-saves on "Key_Return" (you can also add "Key_Enter" for numpad enter)
    - Allows you to disable that incredibly annoying "File saved" notification

  - How?
    - Has to be compiled in dom0 (yes, I know... its pain) 
    - Required packages: xcb-util-devel, xcb-proto, dtkwm-devel, dtkwidget-devel, qt5, deepin-gentext-tools
    - git clone (Clone in a qube with internet, then copy to dom0), `mkdir build && cd build`, `cmake ../`, `make`, `sudo make install`, remove all packages again

  - Worth it?
    - Yes!
  
