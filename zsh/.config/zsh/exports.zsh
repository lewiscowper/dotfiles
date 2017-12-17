# System/shell related exports

# Path variable
export PATH="$HOME/bin:$HOME/n/bin:$HOME/.cargo/bin:$HOME/go/bin:/usr/local/lib:/usr/local/bin:/usr/local/sbin:$PATH"

# N_PREFIX sets the location of the n (node version manager) files and directories
export N_PREFIX="$HOME"

# NODE_REPL_HISTORY sets the location of the node repl history, empty string disables persistent
# history
export NODE_REPL_HISTORY="$HOME/.etc/node_history"

# move npm config file.
export NPM_CONFIG_USERCONFIG="$HOME/.etc/npmrc"

# Move .babel.json (Babel's cache file, elsewhere)
export BABEL_CACHE_PATH="$HOME/.etc/babel.json"

# Movw .lesshst (Less's history file, elsewhere)
export LESSHISTFILE="$HOME/.etc/lesshst"

# Gopath variable because I want to put it inside dev
export GOPATH="$HOME/dev/lewiscowper/go"
export GOBIN="$GOPATH/bin"

# Set shell to zsh (mostly a nicety given this is ~/.zsh/exports but sometimes it helps
export SHELL=/bin/zsh

# Set editor to vim
export EDITOR=/usr/local/bin/nvim

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

# Set up XDG_CONFIG user dirs in the most likely vain hope something looks for them
export XDG_DOWNLOAD_DIR="$HOME/tmp"
