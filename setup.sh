#!/bin/bash

screenshots_location=~/Documents/Screenshots/

# Setup folder for projects
mkdir ~/Projects

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Fish
brew install fish
echo /opt/homebrew/opt/fish/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/opt/fish/bin/fish

# Brew utils
brew install node
brew install z
brew install gh
brew install npm
brew install yarn
brew install composer
brew install volta
brew install git
brew install fzf
brew install starship

# Software
brew install --cask alfred
brew install --cask discord
brew install --cask figma
brew install --cask forklift
brew install --cask iterm2
brew install --cask notion
brew install --cask spotify
brew install --cask slack
brew install --cask steam
brew install --cask visual-studio-code
brew install --cask vlc

# Setup settings
git clone https://github.com/viktordanko/dotfiles ~/Projects/_dotfiles
rm -rf ~/Library/Application\ Support/Code/User
ln -s ~/Projects/vscode ~/Library/Application\ Support/Code/User
ln -s ~/Projects/.config/config.fish ~/.config/fish/config.fish

# Show path in finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder