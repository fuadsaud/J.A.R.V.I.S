#!/usr/bin/env sh

set -euo pipefail

source ./utils.sh
source ./vars.sh

log 'installing homebrew'

if [[ ! -x "$(command -v brew)" ]]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

log 'installing homebrew formulae'

brew update

brew_formulae=(
  ag
  asciinema
  awscli
  bash
  chruby
  clojure
  cowsay
  ctags
  curl
  fzf
  git
  heroku/brew/heroku
  htop
  hub
  iproute2mac
  jq
  leiningen
  mas
  neovim/neovim/neovim
  python
  fasd
  reattach-to-user-namespace
  trash
  tree
  unrar
  tmux
  vim
  youtube-dl
  homebrew/cask-drivers/yubico-authenticator
  zsh
)

brew install ${brew_formulae[@]}
brew install --HEAD ruby-install

log 'installing homebrew casks'

brew_cask_formulae=(
  1password
  atom
  docker
  dropbox
  figma
  flux
  google-chrome
  google-backup-and-sync
  iterm2
  itsycal
  java
  karabiner-elements
  spectacle
  spotify
  transmission
  vlc
  whatsapp

  # fonts
  caskroom/fonts/font-fira-sans
  caskroom/fonts/font-fira-code
  caskroom/fonts/font-comic-neue

  # qmk
  osx-cross/avr/avr-gcc
  osx-cross/avr/dfu-programmer
  osx-cross/avr/avr-dude
  PX4/px4/gcc-arm-none-eabi
)

brew cask install ${brew_cask_formulae[@]}

log 'installing mac app store apps'

mac_store_apps=(
  'Telegram Desktop'
  'Slack'
  'Amphetamine'
  'Daisy Disk'
  'Reeder 3'
  'Pixelmator'
  'Irvue'
  'Shazam'
)

for appname in "${mac_store_apps[@]}"; do
  log "Installing ${appname}"
  mas search "${appname}" | head -n 1 | grep -Eo '\d+' | head -n 1 | xargs mas install
done

log 'letting the system know homebrew-installed zsh'

if ! $(cat /etc/shells | grep); then
  log "appending ${ZSH_BIN} to /etc/shells"

  echo $ZSH_BIN | sudo tee -a /etc/shells > /dev/null
fi

# set mac defaults

# Enables text selection on QuickLook
defaults write com.apple.finder QLEnableTextSelection -bool true

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Automatically illuminate built-in MacBook keyboard in low light
defaults write com.apple.BezelServices kDim -bool true
