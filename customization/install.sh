#!/bin/bash
# This script automatically configures new qubes for my usage


# Check if we have our arguments
if [ "$1" = "--help" ] ; then
	echo -e "--color BLUE | Sets theme color to blue\n--extended YES/NO | Install extended apps (sublime-text, ungoogled-chromium, etc.)\n--kde YES/NO | Dom0 exclusive, install KDE"
	exit
fi

if [ "$1" = "" ] || [ "$2" = "" ]; then
	echo "Missing argument, please run --help"
	exit 1
fi

# This cute handler is copied from Stackoverflow (https://stackoverflow.com/a/14203146)
POSITIONAL_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    -c|--color)
      color="$2"
      shift # past argument
      shift # past value
      ;;
    -e|--extended)
      extended="$2"
      shift # past argument
      shift # past value
      ;;
    -k|--kde)
      kde="$3"
      shift # past argument
      shift # past value
      ;;

    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

echo "Color           = ${color}"
echo "Extended        = ${extended}"
echo "KDE             = ${kde}"


whereami="$(hostname)"

# Check if we are inside dom0, as we cant use DNF and git clone
if [[ "$whereami" == "dom0" ]] ; then
	dnf="qubes-dom0-update"
	dom0=true
	color="BLUE"
else
	dnf="dnf install"
	dom0=false
fi

# This line checks if we are either inside a template (super cheap, I dont use dashes in my qube names, adjust acordingly) or dom0 (see above as to why)
if [[ "$whereami" =~ .*"-".* ]] || $dom0 ; then

	echo "[0/5] - Installing requirements..."

	# If we are inside a template, install the deps first
	sudo $dnf zsh util-linux-user exa fzf micro gnome-tweaks xclip thunar -y
	sudo dnf remove nautilus -y

	# If template is considered non-minimal
	if [ "YES" == $extended ] ; then
		if ! $dom0; then
			# Add sublime repo
			sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
			sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

			# Install extended deps
			sudo dnf remove firefox -y
			sudo dnf install flatpak ddgr neofetch screenfetch sublime-text -y
			flatpak install com.github.Eloston.UngoogledChromium -y
		else
			sudo $dnf rofi # Rofi
			# KDE, huh? fancy boi
			if ["YES" = $kde ] ; then
				sudo $dnf kde-settings-qubes kde-gtk-config
				sudo bash -c 'echo -e "[XDisplay]\nServerArguments=-nolisten tcp -background none" >> /etc/sddm.conf'
				sudo systemctl disable lightdm
				sudo systemctl enable sddm
			fi
		fi
	fi

	echo "[0/5] - Requirements installed"
fi

# Set color-list for qubes
color_list=' RED BLUE BLACK GREEN PURPLE YELLOW '

# Check if our color is in the list
if [[ "$color_list" =~ .*\ $color\ .* ]]; then


	echo "[1/5] - Installing oh-my-zsh and powerlevel10k" && sleep 1
	if $dom0; then
		git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
		git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
	else
		sudo cp -r local-dom0/oh-my-zsh ~/.oh-my-zsh
	fi

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
		profile=$(gsettings get org.gnome.Terminal.ProfilesList default | cut -d \' -f 2) #'"
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

	cp -r themes/Numix-$color ~/.themes
	cp -r Icons/BeautyLine ~/.local/share/icons

	if ! $dom0; then
		# Set Numix for templates / normal VMs
		gsettings set org.gnome.desktop.interface gtk-theme Numix-$color
		gsettings set org.gnome.desktop.interface icon-theme "BeautyLine"
	else
		# Theme our dom0
		if [ "YES" = $kde ] ; then
			# Dom0 using kde
			cp -r local-dom0/kde/Plasma/ ~/.local/share/plasma # Desktoptheme + look-and-feel
			cp -r local-dom0/kde/Konsole/ ~/.local/share/konsole # Konsole
			cp -r local-dom0/kde/Kvantum/ ~/.config/Kvantum # Kvantum
			cp -r local-dom0/kde/Aurorae/ ~/.local/share/Aurorae # Aurorae (Window Decorations)
			cp -r local-dom0/kde/Color-scheme/ ~/.local/share/color-schemes # Color-scheme

			# Nicer Icons
			cp -r Icons/BeautyLine ~/.local/share/icons

			# Actually applying everything
			sudo lookandfeeltool -a Carl
			sudo /usr/libexec/plasma-changeicons BeautyLine

			echo "Dom0 with kde-gtk-config (for GTK apps / menus) cannot easily be set automatically, please manually configure it (System Settings → Application Style → GTK)! Also, please dont forget to reboot first!" && sleep 3
		else
			# XFCE4
			echo "XFCE theeming will be added SoonTM | For now, refer to your trusted source of themes on how to apply those. You can still use any of the Numix-X themes for it, if you so desire" && sleep 3
		fi
	fi


	echo "[5/5] - Doing some last tweaks..." && sleep 1		

	# Some more gnome settings stuff for fonts
	gsettings set org.gnome.desktop.interface monospace-font-name "MesloLGS NF Regular 12"
	gsettings set org.gnome.desktop.interface font-name "Nimbus Sans Regular 12"

	# Thunar magic
	cp -rf xfce4/ ~/.config/xfce4
	if $dom0 ; then
		cp /thunar/uca-dom0.xml ~/.config/Thunar/uca.xml
	else
		cp /thunar/uca.xml ~/.config/Thunar/uca.xml
	fi

	# Rofi config
	if $dom0 ; then
		mkdir -p ~/.local/share/rofi/
		cp -r rofi/themes ~/.local/share/rofi/themes
		cp rofi/config.rasi ~/.config/rofi/
	fi

else
	echo "Color not found"
	exit 1
fi

echo "[DONE] - Done, please restart your qube to make sure everything applied correctly!"
exit 0
# Done, poggers