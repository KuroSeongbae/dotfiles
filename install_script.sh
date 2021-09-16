#!/bin/bash

paru_install_func() {
	list=("$@")
	tput setaf 3;
	for package in "${list[@]}"; do
		echo "Installing package ${package}"
		paru -S --noconfirm --needed $package
	done
	tput sgr0
	# if paru -Qi $1 &> /dev/null; then
	# 	tput setaf 2
  	# 	echo "################## Package "$1" already installed"
    #   	echo
	# 	tput sgr0
	# else
    # 	tput setaf 3
    # 	echo "Installing package "  $1
    # 	echo
    # 	tput sgr0
    # 	sudo pacman -S --noconfirm --needed $1
    # fi
}

pacman_install_func() {
	list=("$@")
	tput setaf 3;
	for package in "${list[@]}"; do
		echo "Installing package ${package}"
		sudo pacman -S --noconfirm --needed $package
	done
	tput sgr0

	# if pacman -Qi $1 &> /dev/null; then
	# 	tput setaf 2
  	# 	echo "################## Package "$1" already installed"
    #   	echo
	# 	tput sgr0
	# else
    # 	tput setaf 3
    # 	echo "Installing package "  $1
    # 	echo
    # 	tput sgr0
    # 	sudo pacman -S --noconfirm --needed $1
    # fi
}

install_everything(){
	echo "Running installation script..."
	install_prerequesites

	echo "Finished! Please reboot your system."
}

install_prerequesites(){
	list=(
		git
		base-devel
	)
	pacman_install_func "${list[@]}"

	tput setaf 3;
	echo "Installing paru"
	cd ~
	git clone https://aur.archlinux.org/paru.git 
	cd paru
	makepkg -si

	tput sgr0
}

install_prerequesites

# Firmware and stuff
install_needed() {
	list=(
		alsa-firmware
		alsa-plugins
		asian-fonts
		bluetooth-support
	)
}

install_useful() {
	list=(
		flameshot
		freedownloadmanager
		gimp
		htop
		noisetorch
		unarj
		unrar
		unzip
		unarchiver
		vlc
		which
		zip
	)
}

install_theming() {
	list=(
		neofetch-git # theming the terminal displaying system properties
		# Fonts
		fontawesome
		noto-fonts
		noto-fonts-cjk
		noto-fonts-emoji
		ttf-dejavu
		ttf-fantasque-sans-mono # coding font
	)
}

install_wm_specifig() {
	list=(
		rofi
	)
}

# git repos
## https://github.com/davatorium/rofi-themes
### get the slate theme for modern look in ~/.local/share/rofi/themes

install_dev_tools() {
	list=(
		android-studio
		android-studio-canary
		code
		git
		godot
		intellij-idea-ce
		pycharm-community-edition
	)
}

install_productivity() {
	list=(
		audacity
		blender
		joplin-desktop
		nano
		obs-studio
		ocenaudio-bin
		shotcut
	)
}

install_communication() {
	list=(
		discord
		# guilded
		signal-desktop
		telegram-desktop
	)
}

install_driver() {
	list=(
		# graphics
		## nvidia => proof which is just dependency and gets installed automatically
		nvidia-dkms 
		nvidia-settings
		nvidia-utils
		opencl-nvidia
		## amd (I don't have D: )

		# Sound
		sof-firmware
	)
}

install_gaming() {
	lig=(
		wine-gecko
		wine-mono
		wine-staging
		lutris

		steam
	)
}

install_browser(){
	list=(
		vivaldi
		vivaldi-ffmpeg-codecs
		# firefox
		# brave
	)
}


## Intersting maybe I'll add it later
# plymouth-git => A graphical boot splash screen with kernel mode-setting support
# timeshift