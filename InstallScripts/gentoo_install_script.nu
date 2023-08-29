#!/usr/bin/env nu

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
