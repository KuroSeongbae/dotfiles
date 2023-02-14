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
		# xorg?

		# WM and stuff
		awesome
		ly

		# apps
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

		# Utilities
		git
		htop
		numlockx # to enable or disable numlock (for autostart)
		unarj
		unrar
		unzip
		unarchiver
		wget
		which
		zip
	)
	
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

install_fonts() {
	list=(
		asian-fonts
		fontawesome
		noto-fonts
		noto-fonts-cjk
		noto-fonts-emoji
		ttf-dejavu
		ttf-fantasque-sans-mono # coding font
	)
		
	paru_install_func "${list[@]}"
}

install_input_and_language() {
	list=(
		fcitx5-qt
	)

	paru_install_func "${list[@]}"
}

install_extra() {
	list=(
		neofetch # theming the terminal displaying system properties
		oneko
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

install_browser(){
	list=(
		vivaldi
		vivaldi-ffmpeg-codecs
	)

	paru_install_func "${list[@]}"
}

setting_up() {
	systemctl enable ly
}

install_everything(){
	echo "Running installation script..."
	
	sudo pacman -Syu --noconfirm --needed
	install_prerequesites
	install_needed
	install_useful
	install_theming
	install_wm_specific
	install_dev_tools
	install_productivity
	install_communication
	install_driver
	install_gaming
	install_wine
	install_browser

	echo "Finished! Please reboot your system."
}

install_everything


## Intersting maybe I'll add it later
# plymouth-git => A graphical boot splash screen with kernel mode-setting support
# timeshift

# git repos
## https://github.com/davatorium/rofi-themes
### get the slate theme for modern look in ~/.local/share/rofi/themes