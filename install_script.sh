install_func() {
	if pacman -Qi $1 &> /dev/null; then
		tput setaf 2
  		echo "################## Package "$1" already installed"
      	echo
		tput sgr0
	else
    	tput setaf 3
    	echo "Installing package "  $1
    	echo
    	tput sgr0
    	sudo pacman -S --noconfirm --needed $1
    fi
}

list=(
git
base-devel
)

echo "Installing paru"
cd ~
git clone https://aur.archlinux.org/paru.git 
cd paru
makepkg -si

tput sgr0

# rofi
# fontawesome
# ttf-font-awesome

# git repos
## https://github.com/davatorium/rofi-themes
### get the slate theme for modern look in ~/.local/share/rofi/themes
