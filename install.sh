#!/bin/bash

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo '* Need to install oh-my-ZSH!'
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

mklink() {
    SRC="$1"
    LNK="$2"
    # if there is already a file
    if [ -f "$LNK" ]; then
        # check it's a symbolic link
        if [ -h "$LNK" ]; then
            echo "* Deleting old symbolic link"
            rm -v "$LNK"
        else
            echo "* File $LNK was already existing, making backup..."
            mv -iv "$LNK" "$LNK.$$.bak"
        fi
    fi
    echo "* Linking"
    ln -sv "$SRC" "$LNK"
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mklink "$DIR/zshrc"           "$HOME/.zshrc"
mklink "$DIR/gitconfig"       "$HOME/.gitconfig"

#cp -r init/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null

source "./macos.sh"
