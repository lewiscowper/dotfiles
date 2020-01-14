# System/shell related exports

# Set shell to zsh (mostly a nicety given this is ~/.zsh/exports but sometimes it helps
export SHELL=/bin/zsh

# Set editor to vim
export EDITOR=nvim

# Set locales and force UTF-8
export LANG='en_GB.UTF-8';
export LC_ALL='en_GB.UTF-8';

# Prevent percentage showing up if output doesn't end with a newline.
PROMPT_EOL_MARK=''

# Remove legacy gap after RPROMPT
ZLE_RPROMPT_INDENT=0

# Change colour of the zsh autosuggest
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'

# Add a HISTORY_IGNORE variable to ignore certain commands from being stored in history
export HISTORY_IGNORE="(ls|cd|cd -|pwd|exit|date|* --help)"

# Add a HIST_IGNORE just in case I get to the point that I stop using zsh
export HIST_IGNORE="ls:cd:cd -:pwd:exit:date:* --help";

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
export XDG_DOWNLOAD_DIR="$HOME"/tmp
export MEDIA_DIR="$HOME"/media
export AUDIO_DIR="${MEDIA_DIR}"/audio
export IMG_DIR="${MEDIA_DIR}"/images
export VIDEO_DIR="${MEDIA_DIR}"/videos

# Some GPG stuff
# export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
# export GPG_TTY=$(tty)

# hide cows in ansible scripts
export ANSIBLE_NOCOWS=1

# Allow homebrew to cleanup unneeded files periodically
export HOMEBREW_INSTALL_CLEANUP=1
