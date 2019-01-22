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

if test "$(brew bundle check >/dev/null 2>&1)"
then
  fancy_echo "Installing specified formulae"
  brew bundle --file="$HOME"/dotfiles/Brewfile
fi

update_shell() {
  local shell_path;
  shell_path="$(command -v zsh)"

  if ! grep "$shell_path" /etc/shells > /dev/null 2>&1 ; then
    fancy_echo "Adding '$shell_path' to /etc/shells"
    sudo sh -c "echo $shell_path >> /etc/shells"
  fi
  sudo chsh -s "$shell_path" "$USER"
}

if [ "$SHELL" != "/bin/zsh" ]; then
  fancy_echo "Changing your shell to zsh"
  update_shell
fi

for dir in ".config", ".local", ".ssh", "dev" "media", "tmp", "docs", "bak", "sync"; do
  if [ ! -d "$HOME/$dir/" ]; then
    mkdir -p "$HOME/$(dir)" && fancy_echo "Created $HOME/$dir"
  fi
done

for dirName in "work" "personal"; do
  if [ ! -d "$HOME/dev/$dirName" ]; then
    mkdir -p "$HOME/dev/$(dirname)" && fancy_echo "Created $HOME/dev/$(dirname)"
  fi
done

for dirName in "audio" "images" "video"; do
  if [ ! -d "$HOME/media/$dirName" ]; then
    mkdir -p "$HOME/media/$(dirname)" && fancy_echo "Created $HOME/media/$(dirname)"
  fi
done

if [ -f "$HOME"/dotfiles/dotcrap ]; then
  fancy_echo "Moving dotcrap into zsh config directory"
  mv "$HOME"/dotfiles/dotcrap "$HOME"/dotfiles/zsh/.config/zsh/_dotcrap
fi

if test "$(command -v stow)"
then
  fancy_echo "Symlinking dotfiles"
  stow bin
  stow git
  stow nvim
  stow tmux
  stow zsh
  stow gnupg
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
