#!/bin/bash

echo "Installing scripts & dev dependencies"
echo "-------------------------------------"

echo "Installing Xcode executables... "
if xcode-select --install; then
  echo "Installed."
else
  echo "Already installed. Cool."
fi

echo " - Homebrew (http://brew.sh/)"
echo "(requires user input: the root password)"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update
brew upgrade

echo "Installing useful programs with Brew"
echo "------------------------------------"
echo "- Install ZSH"
brew install zsh
echo "- Switch to using brew-installed zsh as default shell"
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/zsh
fi
# echo " - Pow (http://pow.cx/)"
# curl get.pow.cx | sh
echo " - GNU wget"
brew install wget
echo " - GNU Coreutils (Read https://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/)"
# TODO: Make sure "/usr/local/opt/coreutils/libexec/gnubin" is in PATH
brew install coreutils
brew install vim --with-override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install git
brew install git-lfs
brew install wget --with-iri
brew install ack

echo "Installing useful programs with Brew Cask"
echo "------------------------------------"
echo " - Brew Cask (http://caskroom.io/)"
brew tap caskroom/cask

if [ ! -d "/Applications/Google\ Chrome.app/" ] && [ ! -d "$HOME/Applications/Google\ Chrome.app/" ]; then
  echo " - Chrome"
  brew cask install google-chrome
fi
echo " - Sublime Text"
brew cask install sublime-text
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
echo " - SourceTree"
brew cask install sourcetree
echo " - Sequel Pro"
brew cask install sequel-pro
echo " - Spotify"
brew cask install spotify
echo " - Useful Quick Look plugins for developers (https://github.com/sindresorhus/quick-look-plugins)"
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv \
                  betterzipql qlimagesize webpquicklook suspicious-package quicklookase qlvideo
echo "- BitBar"
brew cask install bitbar

# echo " - XQuartz (required by gnuplot)"
# brew cask install xquartz
# echo " - Gnuplot"
# brew install gnuplot --with-x11
