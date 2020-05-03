#!/bin/bash
############################
# This script creates symlinks from the home directory to any all necessary dotfiles in ~/dotfiles
# Greatly inspired by Michael Smalley | http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
###########################


##### Declare variables

dir=~/dotfiles			                # dotfiles directory
olddir=~/dotfiles_old		            # old dotfiles backup directory
files="bashrc vimrc tmux.conf Xresources zshrc wgetrc curlrc"		  #list of files/dirs to symlink in ~

#####



# Create dotfiles_old in homedir

echo "Creating $olddir for backup on any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# Change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# Move any existing dotfiles in homedir to dotfiles_old direcotry, then create symlinks
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $olddir"
    	mv ~/.$file ~/dotfiles_old/
   	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/.$file
done

# i3
mkdir -p ~/.config/i3
ln -s ~/dotfiles/i3-config ~/.config/i3/config

# Rofi
mkdir -p ~/.config/rofi
ln -s ~/dotfiles/rofi-config ~/.config/rofi/config

# i3blocks
ln -s ~/dotfiles/i3blocks.conf ~/.config/i3/i3blocks.conf

# Compton
ln -s ~/dotfiles/compton.conf ~/.config/compton.conf

# Ranger
mkdir -p ~/.config/ranger/
ln -s ~/dotfiles/rc.conf ~/.config/ranger/rc.conf

# Alacritty
mkdir -p ~/.config/alacritty
ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
