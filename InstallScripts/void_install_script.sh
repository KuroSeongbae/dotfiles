#!/bin/bash

# TODO: install # rustdesk # unarj# unarchiver# ttf-liberation - not in repo
		# ttf-fantasque-sans-mono # coding font - not in repo# asian-fonts - not in repo
		# fontawesome - not in repo

dotfiles_dir=$(pwd)

flatpak_install_func() {
	list=("$@")
	tput setaf 3;
	for package in "${list[@]}"; do
		echo "Installing package ${package}"
		flatpak install -y --noninteractive $package
	done
	tput sgr0
}

# xbps_src_install_func() {
# 	list=("$@")
# 	tput setaf 3;
# 	for package in "${list[@]}"; do
# 		echo "Installing package ${package}"
# 		paru -S --noconfirm --needed $package
# 	done
# 	tput sgr0
# }

xbps_install_func() {
	list=("$@")
	tput setaf 3;
	for package in "${list[@]}"; do
		echo "Installing package ${package}"
		sudo xbps-install -Sy $package
	done
	tput sgr0
}

install_prerequesites(){
	# nonfree repos
	list=(
		curl
		elogind # idk but need this if I wanna use ly as login manager
		tar
		coreutils
		binutils
		void-repo-nonfree
		git
		util-linux
		pam-devel
		xcb-util-devel
		make
		gcc
		# base-devel
	)
	xbps_install_func "${list[@]}"

	tput setaf 3;
	# create folder
	mkdir ~/.local
	mkdir ~/.local/share
	mkdir ~/.local/share/pkgs

	echo "Installing void-packages"

	cd ~/.local/share/pkgs
	git clone https://github.com/void-linux/void-packages.git

	cd void-packages
	./xbps-src binary-bootstrap

	cd ~

	tput sgr0

	cd "$dotfiles_dir"
}

install_flatpak() {
	list=(
		flatpak
	)

	xbps_install_func "${list[@]}"
}

install_drivers() {
	lit=(
		nvidia
		nvidia-dkms
		sof-firmware # for sound
	)

	xbps_install_func "${list[@]}"
}

install_environment() {
	list=(
		# Xorg
		xorg

		# WM and stuff
		awesome

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

	xbps_install_func "${list[@]}"
}

install_default_utilities() {
	list=(
		# Bluetooth
		blueman # graphical bluetooth manager
		bluez
		libspa-bluetooth # for pipewire users
		
		# Editor
		vscode # writeable problems
		nano

		# Application
		
		# redshift # screen temperatur tool
		vivaldi

		# Utilities
		acpi # battery
		htop
		numlockx # to enable or disable numlock (for autostart)
		wget
		which

		# filesystems
		nfs-utils
		nilfs-utils
		ntp
		unrar
		unzip
		zip

		# sound
		pipewire

		# Printer
		cups
		cups-filters
		cups-pdf
		# HP
		hplip
	)
	
	xbps_install_func "${list[@]}"
}

install_input_and_language() {
	list=(
		# Input management
		fcitx5
		fcitx5-configtool
		fcitx5-qt
		fcitx5-hangul

		# Fonts
		noto-fonts-ttf
		noto-fonts-ttf-extra
		noto-fonts-cjk
		noto-fonts-emoji
		dejavu-fonts-ttf
	)

	xbps_install_func "${list[@]}"
}

install_wine() {
	list=(
		wine
		wine-gecko
		wine-mono
	)
		
	xbps_install_func	"${list[@]}"
}

install_extra() {
	list=(
		neofetch # theming the terminal displaying system properties
		onefetch
		oneko
	)

	xbps_install_func "${list[@]}"
}

install_flatpak_apps() {
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	
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

install_from_git() {
	cd ~/.local/share/pkgs

	# ly login manager
	git clone --recurse-submodules https://github.com/fairyglade/ly
	cd ly
	sudo make install installrunit

	cd ~/.local/share/pkgs

	# gummy
	git clone https://github.com/Fushko/gummy.git --depth 1 && cd gummy
	mkdir build && cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_BUILD_TYPE="Release"
	cmake --build . -j && sudo cmake --install .

	cd ~/.local/share/pkgs

	# noisetorch - noise surpression
	wget https://github.com/noisetorch/NoiseTorch/releases/download/v0.12.2/NoiseTorch_x64_v0.12.2.tgz
	tar -C $HOME -h -xzf NoiseTorch_x64_v0.12.2.tgz
	sudo setcap 'CAP_SYS_RESOURCE=+ep' ~/.local/bin/noisetorch

	cd ~
}

install_audio() {
	list=(
		pipewire
		wireplumber
		pipewire-pulse
		alsa-utils
		rtkit
	)

	xbps_install_func "${list[@]}"
}

setting_up() {
	sudo ln -s /etc/sv/NetworkManager /var/service
	sudo sv up NetworkManager

	sudo ln -s /etc/sv/bluetoothd /var/service
	sudo sv up bluetoothd
	sudo usermod -aG bluetooth seongbae

	sudo ln -s /etc/sv/dbus /var/service
	sudo sv up dbus

	sudo usermod -aG lp seongbae
	sudo usermod -aG audio seongbae

	mkdir ~/.config

	cp -r ../awesome ~/.config/
	cp -r ../dunst ~/.config/
	cp -r ../picom ~/.config/
	cp -r ../paru ~/.config/
	cp -r ../alacritty ~/.config/
	cp ../autostart.sh ~/.config/

	sudo ln -s /etc/sv/ly /var/service/
}

install_everything() {
	echo "Running installation script..."
	
	sudo xbps-install -Suy
	
	install_prerequesites
	install_flatpak
	install_drivers
	install_environment
	install_default_utilities
	install_input_and_language
	install_wine
	install_extra
	install_flatpak_apps
	install_from_git
	
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