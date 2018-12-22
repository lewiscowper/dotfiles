# System/shell related exports

# Set shell to zsh (mostly a nicety given this is ~/.zsh/exports but sometimes it helps
export SHELL=/bin/zsh

# Set editor to vim
export EDITOR=/usr/local/bin/nvim
export VISUAL="atom"

# Set locales and force UTF-8
export LANG='en_GB.UTF-8';
export LC_ALL='en_GB.UTF-8';

# Don't clear the screen after quitting a manual page
export MANPAGER='less -X';

# Prevent percentage showing up if output doesn't end with a newline.
PROMPT_EOL_MARK=''

# Remove legacy gap after RPROMPT
ZLE_RPROMPT_INDENT=0

# Change colour of the zsh autosuggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'

# Custom userland exports

# Opt out of homebrew analytics tracking
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

# Set brew cask to install to ~/Applications instead of /Applications
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

# Set enhancd filter to fzf
export ENHANCD_FILTER="fzf"

# Set fzf to be a bit more user friendly by default
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# https://mike.place/2017/fzf-fd/
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

# Set dev directories for use elsewhere
export DEV_DIR="$HOME"/dev/personal
export WORKDEV_DIR="$HOME"/dev/work

# Export directories for use elsewhere
export MEDIA_DIR="$HOME"/media
export AUDIO_DIR="${MEDIA_DIR}"/audio
export IMG_DIR="${MEDIA_DIR}"/images
export VIDEO_DIR="${MEDIA_DIR}"/videos

# Some GPG stuff
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GPG_TTY=$(tty)

# hide cows in ansible scripts
export ANSIBLE_NOCOWS=1
