#!/usr/bin/env nu
# Wayland: 
# add global use flag: wayland
# For nvidia driver support add in make.conf: USE="dist-kernel dbus"
# And: VIDEO_CARDS="nvidia"
# After nvidia driver installation run:
# lsmod | grep nvidia
# rmmod nvidia
# modprobe nvidia 
# Wine:
# for EAC enable use flag: sys-libs/glibc hash-sysv-compat
# Audio with pipewire:
# Global useflag: pulseaudio elogind -systemd
# add elogind to start at boot time: rc-update add elogind boot
# add user to audio and pipewire group

def main [] {
  let pkgs = language_packages
  let inst = $"sudo emerge -a --autounmask --autounmask-write ($pkgs)"
  nu -c $inst
}

def gentoo_packages [] {
  let $packages = [
    'app-eselect/eselect-repository'
  ] | str join ' '

  return $packages
}

def audio [] {
	let $packages = [
		'media-video/wireplumber'
		'media-video/pipewire'
		'sys-auth/rtkit'
	]
}

def nvidia [] {
	let $packages = [
		'x11-drivers/nvidia-drivers'
	] | str join ' '

  return $packages
}

def wayland_packages [] {
  eselect repository enable guru
  emerge --sync guru
  let $packages = [
    'gui-wm/hyprland'
    'gui-apps/waybar'
    'dev-libs/date'
    'gui-apps/wl-clipboard'
    'gui-apps/grim'
    'gui-apps/slurp'
    'gui-libs/xdg-desktop-portal-hyprland'
    'x11-misc/xdg-user-dirs'
  ] | str join ' '

  return $packages
}

def wine [] {
	let $packages = [
		'virtual/wine'
		'app-emulation/winetricks'
		'sys-libs/glibc'
	] | str join ' '

  return $packages
}

def android_packages [] {
	let $packages = [
		'sys-fs/android-file-transfer-linux'
	] | str join ' '

	return $packages
}

def language_packages [] {
  let $packages = [
   # app-i18n/fcitx,
    'media-fonts/noto',
    'media-fonts/iosevka',
    'media-fonts/noto-emoji',
    'media-fonts/mikachan-font-ttf', # Japanese
    'media-fonts/alee-fonts', # Korean
  ] | str join ' '

  return $packages
} 
