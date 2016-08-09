#!/bin/bash

function link_rc {
    rc_dst="$HOME/.$1"

    if [ -h $rc_dst ]; then # dst exists as a symlink
        rm $rc_dst
    fi
    if [ -f $rc_dst ]; then # dst exists as a normal file
        mv $rc_dst "${rc_dst}.old"
    fi

    ln -s "$(pwd)/dotfiles/$1" $rc_dst
}

read -p "This will wipe out some of your local rc files in ${HOME} and replace them with symlinks to this repo. The originals will be backed up to '*.old'. Continue [Ny]?" -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then

    for filepath in $(pwd)/dotfiles/*; do
        filename=$(basename $filepath)
        link_rc $filename
        printf "linked $filename\n"
    done
fi

