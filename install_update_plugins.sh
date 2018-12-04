#!/bin/bash

echo "Updating/Cleaning Vim plugins..."

vim -E -s <<-EOF
    :PlugInstall
    :PluginUpdate
    :PlugClean
    #PlugUpgrade update Plug plugin manager
    :qa
EOF
