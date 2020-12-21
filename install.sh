#!/usr/bin/env bash
set -e

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\\n$fmt\\n" "$@"
}

fancy_echo "Starting install script"

if test "$(command -v curl)"
then
  fancy_echo "Grabbing dotcrap file"
  pushd "$HOME"/dotfiles
  curl -O https://raw.githubusercontent.com/lewiscowper/dotcrap/master/dotcrap
  # shellcheck disable=SC1091,1090
  source "$HOME"/dotfiles/dotcrap
  popd
fi


if test "$(uname)" = "Darwin"
then
  fancy_echo "Setting Macos defaults"
  sh mac/mac.sh

  fancy_echo "Downloading mac specific files"
  sh mac/downloads.sh

  fancy_echo "Installing terminfo for italics support"
  tic -x mac/tmux-256color.terminfo
  tic -x mac/xterm-256color-italic.terminfo
fi

# Check for Homebrew
if test ! "$(command -v brew)"
then
  fancy_echo "Installing Homebrew for you."

  # Only try to install Homebrew on macOS
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

fi

# Check for Homebrew
if test "$(command -v brew)"
then
  fancy_echo "Updating Homebrew formulae"
  brew update --force # https://github.com/Homebrew/brew/issues/1151
fi

if test "$(command -v brew)"
then
  fancy_echo "Installing specified formulae"
  brew bundle --file="$HOME"/dotfiles/Brewfile
fi

for dir in ".config" ".local" ".ssh" "dev" "desk" "files"; do
  if [ ! -d "$HOME/$dir" ]; then
    mkdir "$HOME/$dir" && fancy_echo "Created $HOME/$dir"
  fi
done

for dirName in "audio" "images" "video" "sync"; do
  if [ ! -d "$HOME/files/$dirName" ]; then
    mkdir "$HOME/files/$dirName" && fancy_echo "Created $HOME/files/$dirName"
  fi
done

if [ -f "$HOME"/dotfiles/dotcrap ]; then
  fancy_echo "Linking dotcrap into zsh config directory"
  ln -s "$HOME"/dotfiles/zsh/.config/zsh/_dotcrap "$HOME"/dotfiles/dotcrap
fi

fancy_echo "Hiding capitalised special directories from Finder"
chflags hidden "$HOME"/Desktop "$HOME"/Documents "$HOME"/Downloads "$HOME"/Library
chflags hidden "$HOME"/Movies "$HOME"/Music "$HOME"/Pictures "$HOME"/Public

fancy_echo "Symlinking Desktop to desk"
sudo rm -rf "$HOME"/Desktop
ln -s desk "$HOME"/Desktop

fancy_echo "Symlinking Downloads to desk"
sudo rm -rf "$HOME"/Downloads
ln -s desk "$HOME"/Downloads

fancy_echo "Symlinking sync to iCloud"
ln -s sync "$HOME"/Library/Mobile Documents/com~apple~CloudDocs

if test "$(command -v stow)"
then
  fancy_echo "Symlinking dotfiles"
  stow bin
  stow git
  stow karabiner
  stow iterm2
  stow nvim
  stow tmux
  stow zsh
fi

# Python neovim prerequisites for plugins
if test "$(command -v python3)"
then
  pip3 install --user pynvim
fi

# vim-plug
if [ ! -e "$HOME"/.config/nvim/autoload/plug.vim ]; then
  fancy_echo "Installing vim-plug"
  curl -fLo "$HOME"/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
nvim +PlugInstall +PlugUpgrade +PlugUpdate +PlugClean! +UpdateRemotePlugins +qall

fancy_echo "Ending install script"

exit 0
