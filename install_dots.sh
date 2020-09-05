#!/bin/bash
# Install packages and download dotfiles
# Some snippets from public projects like da667's Autosnort.

# Do not run the code without understanding what it does!

set -euo pipefail

#######################
###### FUNCTIONS ######
#######################

logfile=~/dotfiles-install.log
mkfifo ${logfile}.pipe
tee < ${logfile}.pipe $logfile &
exec &> ${logfile}.pipe
rm ${logfile}.pipe

function print_status ()
{
    echo -e "\x1B[01;34m[*]\x1B[0m $1"
}

function print_good ()
{
    echo -e "\x1B[01;32m[*]\x1B[0m $1"
}

function print_error ()
{
    echo -e "\x1B[01;31m[*]\x1B[0m $1"
}

function print_notification ()
{
	echo -e "\x1B[01;33m[*]\x1B[0m $1"
}

# Check if tasks returns non zero exit code
function error_check
{
if [ $? -eq 0 ]; then
	print_good "$1 successful."
else
	print_error "$1 failed. Please check $logfile for more details."
exit 1
fi
}

# Check if dir exists and create if necessary.
function dir_check()
{
if [ ! -d $1 ]; then
	print_notification "$1 does not exist. Creating.."
	mkdir -p $1
else
	print_notification "$1 already exists. (No problem, We'll use it anyhow)"
fi
}

function install_packages()
{

sudo apt update &>> $logfile && sudo apt install -y ${@} &>> $logfile
error_check 'Package installation'

}

#######################
##### MAIN SCRIPT #####
#######################

# supress messages during package installation
export DEBIAN_FRONTEND=noninteractive

# System updates
print_status "Performing apt update and upgrade"
sudo apt update &>> $logfile && sudo apt -y upgrade &>> $logfile
error_check 'System updates'

# install software
print_status "Installing packges: git net-tools lxappearance i3 i3lock i3blocks rofi compton feh arandr xfce4-power-manager flameshot arandr vim tmux wget curl ranger rxvt-unicode gnome-terminal zsh zsh-syntax-highlighting"

declare -a packages=( git net-tools lxappearance i3 i3lock i3blocks rofi compton feh arandr xfce4-power-manager flameshot arandr vim tmux wget curl ranger rxvt-unicode gnome-terminal zsh zsh-syntax-highlighting );

install_packages ${packages[@]}

# Clone the dotfiles repo

print_status "Cloning the git repo and proceeding to install the dotfiles"

cd ~/
git clone https://github.com/o3tz1/dotfiles.git ~
cd ~/dotfiles

dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc vimrc tmux.conf Xresources zshrc wgetrc curlrc"

print_status "Creating $olddir for backup"
dir_check $olddir

print_status "Moving any existing dotfiles to $olddir and creating symlinks for the new dotfiles"

cd $dir

for file in $files; do
    print_status "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    print_status "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

dir_check ~/.config/i3
ln -s ~/dotfiles/i3-config ~/.config/i3/config

dir_check ~/.config/rofi
ln -s ~/dotfiles/rofi-config ~/.config/rofi/config

ln -s ~/dotfiles/i3blocks.conf ~/.config/i3/i3blocks.conf

ln -s ~/dotfiles/compton.conf ~/.config/compton.conf

dir_check ~/.config/ranger
ln -s ~/dotfiles/rc.conf ~/.config/ranger/rc.conf

dir_check ~/.config/alacritty
ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

# install and update vim plugins
print_status "Installing and updating the vim plugins"

vim -E -s <<-EOF
    :PlugInstall
    :PluginUpdate
    :PlugClean
    #PlugUpgrade update Plug plugin manager
    :qa
EOF

# change shell to zs
print_status "Changing shell to ZSH
chsh -s /bin/zsh

print_good "Script ready, enjoy the new machine!"
print_status "Remember to reboot the system"
