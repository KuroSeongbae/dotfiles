#!/bin/bash

# add kscreen for display arrangement when using minimal plasman desktop

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

# Firmware and stuff
install_needed() {
	list=(
		alsa-firmware
		alsa-plugins
		asian-fonts
		bluetooth-support
	)
	paru_install_func "${list[@]}"
}

install_useful() {
	list=(
		flameshot
		freedownloadmanager
		htop
		noisetorch
		thunar
		unarj
		unrar
		unzip
		unarchiver
		vlc
		wget
		which
		zip
	)

	paru_install_func "${list[@]}"
}

install_theming() {
	list=(
		neofetch # theming the terminal displaying system properties
		# Fonts
		fontawesome
		noto-fonts
		noto-fonts-cjk
		noto-fonts-emoji
		ttf-dejavu
		ttf-fantasque-sans-mono # coding font
	)

	paru_install_func "${list[@]}"
}

install_wm_specific() {
	list=(
		rofi
	)

	paru_install_func "${list[@]}"
}

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

	paru_install_func "${list[@]}"
}

install_productivity() {
	list=(
		audacity
		blender
		gimp
		joplin-desktop
		nano
		obs-studio
		ocenaudio-bin
		shotcut
	)

	paru_install_func "${list[@]}"
}

install_communication() {
	list=(
		discord
		# guilded
		signal-desktop
		telegram-desktop
	)

	paru_install_func "${list[@]}"
}

#activate multilib in /etc/pacman.conf repos before installing this
install_driver() {
	list=(
		# graphics
		nvidia #=> proof which is just dependency and gets installed automatically
		nvidia-dkms 
		nvidia-settings
		nvidia-utils
		lib32-nvidia-utils
		opencl-nvidia
		vulkan-icd-loader
		lib32-vulkan-icd-loader

		## amd (I don't have D: )

		# Sound
		sof-firmware
	)

	paru_install_func "${list[@]}"
}

install_gaming() {
	list=(
		lutris
		steam
	)

	paru_install_func "${list[@]}"
}

# I will sort stuff out some day... maybe... when I'm not too lazy....
install_wine() {
	list=(
		wine-gecko
		wine-mono
		wine-staging

		giflib 
		lib32-giflib
		
		libpng
		lib32-libpng
		
		libldap
		lib32-libldap
		
		gnutls 
		lib32-gnutls

		mpg123
		lib32-mpg123
		
		openal
		lib32-openal
		
		v4l-utils
		lib32-v4l-utils
		
		libpulse
		lib32-libpulse
		
		libgpg-error
		lib32-libgpg-error
		
		alsa-plugins
		lib32-alsa-plugins
		
		alsa-lib
		lib32-alsa-lib
		
		libjpeg-turbo
		lib32-libjpeg-turbo
		
		sqlite
		lib32-sqlite
		
		libxcomposite
		lib32-libxcomposite
		
		libxinerama
		lib32-libgcrypt
		
		libgcrypt
		lib32-libxinerama
		
		ncurses
		lib32-ncurses
		
		opencl-icd-loader
		lib32-opencl-icd-loader
		
		libxslt
		lib32-libxslt
		
		libva
		lib32-libva
		
		gtk3
		lib32-gtk3
		
		gst-plugins-base-libs
		lib32-gst-plugins-base-libs

		
		paru_install_func "${list[@]}"
	)
}

install_browser(){
	list=(
		vivaldi
		vivaldi-ffmpeg-codecs
		firefox
		# brave
	)

	paru_install_func "${list[@]}"
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