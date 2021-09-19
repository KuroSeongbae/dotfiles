#!/bin/bash

# make sure that you have paru installed
paru_install_func() {
	list=("$@")
	tput setaf 3;
	for package in "${list[@]}"; do
		echo "Installing package ${package}"
		paru -S --noconfirm --needed $package
	done
	tput sgr0
} 

install_it() {
    list=(
        polybar
        nitrogen
        picom
    )

    paru_install_func "${list[@]}"
}

install_it