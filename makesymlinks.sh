#!/bin/bash
############################
# This script creates symlinks from the home directory to any all necessary dotfiles in ~/dotfiles
# Greatly inspired by Michael Smalley | http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
###########################


##### Declare variables

dir=~/dotfiles			# dotfiles directory
olddir=~/dotfiles_old		# old dotfiles backup directory
files="bashrc vimrc tmux.conf"		#list of files/dirs to symlink in ~

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
