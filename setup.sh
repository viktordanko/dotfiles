#!/bin/bash

# Setup folder for projects
mkdir ~/htdocs

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Fish
brew install fish
sudo echo /usr/local/bin/fish >> /etc/shells
chsh -s /usr/local/bin/fish

# Brew utils
brew install node
brew install z
brew install gh
brew install npm
brew install yarn
brew install volta

# Software
brew cask install visual-studio-code
brew cask install iterm2
brew cask install notion
brew cask install discord
brew cask install vlc
brew cask install spotify
brew cask install steam

# Setup settings
git clone https://github.com/viktordanko/dotfiles ~/htdocs/_dotfiles
rm -rf ~/Library/ApplicationSupport/Code/User
ln -s ~/htdocs/_dotfiles/vscode ~/Library/ApplicationSupport/Code/User

# Show path in finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder