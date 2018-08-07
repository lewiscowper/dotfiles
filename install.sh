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
fi

if test "$(brew bundle check >/dev/null 2>&1)"
then
  fancy_echo "Installing specified formulae"
  brew bundle --file=~/dotfiles/Brewfile
fi

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

for dir in "bin" "dev" "media" "scratch"; do
  if [ ! -d "$HOME/$dir/" ]; then
    mkdir "$HOME/$dir"
  fi
done

fancy_echo "Creating directories in ~/media"

for dirName in "audio" "images" "video"; do
  if [ ! -d "$HOME/media/$dirName" ]; then
    mkdir -p "$HOME/media/$(dirname)"
  fi
done

if test "$(which stow)"
then
  fancy_echo "Symlinking dotfiles"
  stow git
  stow nvim
  stow tmux
  stow zsh
fi

# create vim symlinks
# As I have moved off of vim as my full time editor in favor of neovim,
# I feel it doesn't make sense to leave my vimrc intact in the dotfiles repo
# as it is not really being actively maintained. However, I would still
# like to configure vim, so lets symlink ~/.vimrc and ~/.vim over to their
# neovim equivalent.

fancy_echo "Creating vim symlinks"
fancy_echo "=============================="
VIMFILES=( "$HOME/.vim:$HOME/.config/nvim"
        "$HOME/.vimrc:$HOME/.config/nvim/init.vim" )

for file in "${VIMFILES[@]}"; do
    KEY=${file%%:*}
    VALUE=${file#*:}
    if [ -e "${KEY}" ]; then
        fancy_echo "${KEY} already exists... skipping."
    else
        fancy_echo "Creating symlink for $KEY"
        ln -s "${VALUE}" "${KEY}"
    fi
done

# vim-plug
if [ ! -e ~/.config/nvim/autoload/plug.vim ]; then
  fancy_echo "Installing vim-plug"
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
nvim +PlugInstall +PlugUpgrade +PlugUpdate +PlugClean! +UpdateRemotePlugins +qall

fancy_echo "Ending install script"

exit 0
