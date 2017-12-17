#!/bin/bash
set -e

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\\n$fmt\\n" "$@"
}

fancy_echo "Beginning install script"

# Check for Homebrew
if test ! "$(which brew)"
then
  fancy_echo "Installing Homebrew for you."

  # Only try to install Homebrew on macOS
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

fi

# Check for Homebrew
if test "$(which brew)"
then
  fancy_echo "Updating Homebrew formulae"
  brew update --force # https://github.com/Homebrew/brew/issues/1151
  brew bundle --file=mac/.Brewfile
fi

# Do postinstall install of fzf
fancy_echo "fzf post install stuff"
$(brew --prefix)/opt/fzf/install --no-update-rc --completion --key-bindings

update_shell() {
  local shell_path;
  shell_path="$(which zsh)"

  fancy_echo "Changing your shell to zsh"
  if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
    fancy_echo "Adding '$shell_path' to /etc/shells"
    sudo sh -c "echo $shell_path >> /etc/shells"
  fi
  sudo chsh -s "$shell_path" "$USER"
}

case "$SHELL" in
  */zsh)
    if [ "$(which zsh)" != '/usr/local/bin/zsh' ] ; then
      update_shell
    fi
    ;;
  *)
    update_shell
    ;;
esac

fancy_echo "Creating directories in ~"

if [ ! -d "$HOME/bin/" ]; then
  mkdir "$HOME/bin"
fi

if [ ! -d "$HOME/dev/" ]; then
  mkdir "$HOME/dev"
fi

if [ ! -d "$HOME/screensaver/" ]; then
  mkdir "$HOME/screensaver"
fi

if [ ! -d "$HOME/talks/" ]; then
  mkdir "$HOME/talks"
fi

if [ ! -d "$HOME/videos/" ]; then
  mkdir "$HOME/videos"
fi

if test "$(which stow)"
then
  fancy_echo "Symlinking dotfiles"
  stow vcs
  stow nvim
  stow tmux
  stow zsh
  stow jrnl
fi

# vim-plug
if [ ! -e ~/.config/nvim/autoload/plug.vim ]; then
  fancy_echo "Installing vim-plug"
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
nvim +PlugInstall +PlugUpgrade +PlugUpdate +PlugClean! +UpdateRemotePlugins +qall

if test ! "$(which n)"
then
  fancy_echo "Installing n - a node version manager"
  npm install -g n
fi

if test "$(which n)"
then
  fancy_echo "Installing latest LTS version of node"
  n lts
fi

fancy_echo "Ending install script"

exit 0
