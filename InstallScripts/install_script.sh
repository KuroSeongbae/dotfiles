#!/bin/bash

flatpak_install_func() {
	list=("$@")
	tput setaf 3;
	for package in "${list[@]}"; do
		echo "Installing package ${package}"
		flatpak install $package
	done
	tput sgr0
}

paru_install_func() {
	list=("$@")
	tput setaf 3;
	for package in "${list[@]}"; do
		echo "Installing package ${package}"
		paru -S --noconfirm --needed $package
	done
	tput sgr0
}

pacman_install_func() {
	list=("$@")
	tput setaf 3;
	for package in "${list[@]}"; do
		echo "Installing package ${package}"
		sudo pacman -S --noconfirm --needed $package
	done
	tput sgr0
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

install_flatpak() {
	list=(
		flatpak
	)

	paru_install_func "${list[@]}"
}

install_drivers() {
	lit=(
		nvidia-dkms
		nvidia-utils
	)

	paru_install_func "${list[@]}"
}

install_environment() {
	list=(
		# Xorg
		xorg

		# WM and stuff
		awesome
		ly

		# apps
		alacritty
		dunst # notification manager (needed for flameshot to work)
		flameshot # make screenshot
		lxsession
		rofi
		picom
		network-manager-applet
		nitrogen

		# Filemanager
		nemo
		nemo-fileroller
		nemo-terminal
	)

	# starship

	paru_install_func "${list[@]}"
}

install_default_utilities() {
	list=(
		# Bluetooth
		blueman # graphical bluetooth manager
		bluez
		bluez-utils
		
		# Editor
		code
		nano

		# Application
		gammy
		rustdesk
		redshift # screen temperatur tool
		noisetorch # noise surpression
		vivaldi
		vivaldi-ffmpeg-codecs

		# Utilities
		git
		htop
		numlockx # to enable or disable numlock (for autostart)
		wget
		which

		# filesystems
		ntp
		nfs-utils
		nilfs-utils
		ntp
		unarj
		unrar
		unzip
		unarchiver
		zip

		# Printer
		cup
		cups-filters
		cups-pdf
		# HP
		hplip
	)
	
	paru_install_func "${list[@]}"
}

install_flatpak_apps() {
	list=(
		# Productivity
		org.gimp.GIMP
		org.kde.krita
		net.cozic.joplin_desktop
		org.kde.gwenview
		org.videolan.VLC
		org.kde.okular
		org.mozilla.firefox
		org.mozilla.Thunderbird
		org.freedownloadmanager.Manager
		com.sublimemerge.App

		# Gaming
		com.valvesoftware.Steam
		com.heroicgameslauncher.hgl
		net.lutris.Lutris

		# Communication
		com.discordapp.Discord
		org.signal.Signal
	)

	flatpak_install_func "${list[@]}"
}

install_input_and_language() {
	list=(
		# Input management
		fcitx5
		fcitx5-configtool
		fcitx5-qt
		fcitx5-hangul

		# Fonts
		asian-fonts
		fontawesome
		noto-fonts
		noto-fonts-cjk
		noto-fonts-emoji
		ttf-dejavu
		ttf-liberation
		ttf-fantasque-sans-mono # coding font
	)

	paru_install_func "${list[@]}"
}

install_wine() {
	list=(
		wine-gecko
		wine-mono
		wine-staging
		
		paru_install_func "${list[@]}"
	)
}

install_extra() {
	list=(
		neofetch # theming the terminal displaying system properties
		oneko
	)

	paru_install_func "${list[@]}"
}

setting_up() {
	systemctl enable ly

	cp -r ../awesome ~/.config/
	cp -r ../dunst ~/.config/
	cp -r ../picom ~/.config/
	cp -r ../paru ~/.config/
	cp -r ../alacritty ~/.config/
}

install_everything(){
	echo "Running installation script..."
	
	sudo pacman -Syu --noconfirm --needed
	
	install_drivers
	install_environment
	install_default_utilities
	install_flatpak_apps
	install_input_and_language
	install_wine
	install_extra
	
	setting_up

	echo "Finished! Please reboot your system."
}

install_everything


## Intersting maybe I'll add it later
# plymouth-git => A graphical boot splash screen with kernel mode-setting support
# timeshift

# git repos
## https://github.com/davatorium/rofi-themes
### get the slate theme for modern look in ~/.local/share/rofi/themes