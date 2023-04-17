#!/bin/bash
# This script automatically configures new qubes for my usage


# Check if we have our arguments
if [ "$1" = "" ] ; then
	echo "Missing Qube color argument"
	exit 1
fi


# This is a super cheap template check, because I dont use "-" inside my normal qubes
whereami="$(hostname)"
if [[ "$whereami" =~ .*"-".* ]] ; then

	echo "[0/5] - Installing requirements..."
	if [ "$2" = "" ] ; then
		echo "Unset argument: 'extended' | Only essential dependencies will be installed!"
	fi

	# If we are inside a template, install the deps first
	sudo dnf install zsh util-linux-user exa fzf micro gnome-tweaks xclip thunar -y
	sudo dnf remove nautilus -y

	# If template is considered non-minimal
	if [ "extended" == $2 ] ; then

		# Add sublime repo
		sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
		sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

		# Install extended deps
		sudo dnf remove firefox -y
		sudo dnf install flatpak ddgr neofetch screenfetch sublime -y
		flatpak install com.github.Eloston.UngoogledChromium -y
	fi

	echo "[0/5] - Requirements installed"
fi

# Set color-list for qubes
color_list=' RED BLUE BLACK GREEN PURPLE YELLOW '

# Check if our color is in the list
if [[ "$color_list" =~ .*\ $1\ .* ]]; then


	echo "[1/5] - Installing zsh and powerlevel10k" && sleep 1
	git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

	# Move my zshrc config & powerlevel10k
	cp zshrc ~/.zshrc
	cp p10k.zsh ~/.p10k.zsh


	echo "[2/5] - Installing fonts" && sleep 1

	# Make required folder for fonts
	mkdir ~/.fonts

	# Move fonts
	cp -r fonts/ ~/

	# Clear fonts cache
	fc-cache

	
	echo "[3/5] - Configuring GNOME Terminal" && sleep 1		

	# We check if we are using  gnome-terminal, and if so, we configure it
	# Dont question the comments, they are just there to fix my syntax highlighting lol
	terminal="$(ps -o comm= -p "$(($(ps -o ppid= -p "$(($(ps -o sid= -p "$$")))")))")"
	if [ "$terminal" = "gnome-terminal-" ] ; then
		profile=$(gsettings get org.gnome.Terminal.ProfilesList default | cut -d \' -f 2) #' 
		dconf write /org/gnome/terminal/legacy/profiles:/:${profile}/use-custom-command true
		dconf write /org/gnome/terminal/legacy/profiles:/:${profile}/custom-command \"/bin/zsh\" #"
		dconf write /org/gnome/terminal/legacy/profiles:/:${profile}/default-size-rows 18
		dconf write /org/gnome/terminal/legacy/profiles:/:${profile}/default-size-columns 96

	else
		echo "[3/5] - Unable to configure shell (not using gnome-terminal). Please manually configure that"
	fi


	echo "[4/5] - Installing theme" && sleep 1

	# Last but not least, lets install our theme and icons
	mkdir ~/.themes
	mkdir -p ~/.local/share/icons

	cp -r themes/Numix-$1 ~/.themes
	cp -r Icons/BeautyLine ~/.local/share/icons

	gsettings set org.gnome.desktop.interface gtk-theme Numix-$1
	gsettings set org.gnome.desktop.interface icon-theme "BeautyLine"

	echo "[5/5] - Doing some last tweaks..." && sleep 1		

	# And do some more settings stuff
	gsettings set org.gnome.desktop.interface monospace-font-name "MesloLGS NF Regular 12"
	gsettings set org.gnome.desktop.interface font-name "Nimbus Sans Regular 12"
	cp -rf xfce4/ ~/.config/xfce4
else
	echo "Color not found"
	exit 1
fi

echo "[DONE] - Done, please restart your qube to make sure everything applied correctly!"
exit
# Done, poggers
