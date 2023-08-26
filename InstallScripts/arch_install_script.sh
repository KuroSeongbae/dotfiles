#!/bin/bash

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

	cd "$dotfiles_dir"
}

install_amd() {
  list=()
}

install_nvidia() {
  list=(
    nvidia-dkms
    nvidia-utils
    )
}

install_drivers() {
	list=(
		sof-firmware # for sound
	)

	paru_install_func "${list[@]}"
}

install_x() {
  list=(
    xorg
    awesome
		rofi
		picom
		nitrogen
    )
}

install_wayland() {
  list=(
    wayland
    hyprland
    )
}

install_apps() {
	list=(
    # Filemanager
		nemo
		nemo-fileroller
		nemo-terminal

		# Bluetooth
		blueman # graphical bluetooth manager
		bluez
		bluez-utils
		
		# Editor
		code
	  helix
    neovim
		nano

		# Application
		# gummy
		# rustdesk
		# redshift # screen temperatur tool
		# noisetorch # noise surpression
    firefox
		# vivaldi
		# vivaldi-ffmpeg-codecs
		dunst # notification manager (needed for flameshot to work)
		flameshot # make screenshot
		lxsession
		network-manager-applet

		# Utilities
    acpi # battery
    curl
		htop
		numlockx # to enable or disable numlock (for autostart)
		pavucontrol
		wget
		which
		xdg-desktop-portal # for opening links in flatpak apps (frontend)
		xdg-desktop-portal-gtk # for opening links in flatpak apps (backend)
    flatpak

    # Terminal stuff
    wezterm
    nushell
    starship
		neofetch # theming the terminal displaying system properties
		# zellij wezterm already doing that job sry

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

    # Printer (which never worked anyways btw.)
		cup
		cups-filters
		cups-pdf
		# HP
		hplip
	)
	
	paru_install_func "${list[@]}"
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

install_flatpak_apps() {
	list=(
		# Productivity
		# org.gimp.GIMP
		org.kde.krita
		net.cozic.joplin_desktop
		org.kde.gwenview
		org.videolan.VLC
		org.kde.okular
		# org.mozilla.firefox
		org.mozilla.Thunderbird
		# com.sublimemerge.App

		# Gaming
		com.valvesoftware.Steam
		com.heroicgameslauncher.hgl
		net.lutris.Lutris

		# Communication
		com.discordapp.Discord
		org.signal.Signal

    com.github.tchx84.Flatseal # manages flatpak permission
	)

	flatpak_install_func "${list[@]}"
}

install_extra() {
	list=(
		oneko
	)

	paru_install_func "${list[@]}"
}

setting_up() {
	sudo systemctl enable NetworkManager

	sudo usermod -aG lp seongbae
	sudo systemctl enable bluetooth

	# cp -r "../awesome" ~/.config/
	# cp -r "../dunst" ~/.config/
	# cp -r "../picom" ~/.config/
	# cp -r "../paru" ~/.config/
	# cp -r "../alacritty" ~/.config/
	# cp -r "../helix" ~/.config/
	# cp "../autostart.sh" .conig/
}

install_everything(){
	echo "Running installation script..."
	
	sudo pacman -Syu --noconfirm --needed
	
	install_prerequesites
  install_amd
  # install_nvidia
	install_drivers
  # install_x
  install_wayland
	install_apps
	install_input_and_language
	install_wine
	install_flatpak_apps
	# install_extra
	
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
