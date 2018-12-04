# cp and mv are now "interactive", aka will prompt before overwrite
alias cp='cp -i'
alias mv='mv -i'

# little editor shorthands, e for edit directly in terminal, g for "graphically edit"
alias e="$EDITOR"
alias g="$VISUAL"

# While I remember this from 'eXtract Ze Files', this can be handy
alias untar='tar xvf'

# This allows me to use sudo with aliases
alias sudo='sudo '

# Little process finder, usage: procs <process name>
alias procs='ps aux | grep -i'

# reload shell config
alias sz='source $XDG_CONFIG_HOME/zsh/.zshrc'

# Handy function to determine if a command is installed
_has() {
  command -v $1>/dev/null 2>&1
}

# Lovely ls replacement that adds colours and icons and so on
# https://github.com/athityakumar/colorls
# Need a powerline patched font
#
# gem install colorls
if _has colorls; then
  alias ls='colorls -l -A --sd'
fi

# A lovely cat replacement written in Rust
# https://github.com/sharkdp/bat
# Supports syntax highlighting and paging and so on
#
# brew install bat
if _has bat; then
  alias cat='bat'
fi

# Neovim is an interesting vim fork focussed on usability and extensibility
# https://github.com/neovim/neovim
#
# brew install neovim
if _has nvim; then
  alias vim='nvim'
fi

# Tmux manages my workflow and sessions
# https://github.com/tmux/tmux
#
# brew install tmux
if _has tmux; then
  # This sets a tmux compatible term variable, then launches tmux with the following options:
  #
  # -2 => force 256 colour mode
  # -f => sets a config file as I like to keep my home directory clean, and uses XDG directory spec
  alias tmux='TERM=xterm-256color tmux -2 -f $XDG_CONFIG_HOME/tmux/conf'
  # Shorthand to attach to a session by tag, e.g. ta <tag>
  alias ta="tmux attach -t"
  # Shorthand to create a new session by tag, e.g. tn <tag>
  alias tn="tmux new-session -t"
  # Shorthand to list all sessions
  alias tls="tmux list-sessions"
fi

# Weechat is my irc client of choice
# https://github.com/weechat/weechat
#
# brew install weechat
if _has weechat; then
  # Launches weechat with the following options:
  #
  # => -d sets a config file directory using the XDG directory spec to keep ~ clean
  alias weechat='weechat -d $XDG_CONFIG_HOME/weechat'
fi

# Docker runs docker containers, remarkable that
# https://download.docker.com/mac/stable/Docker.dmg
#
# Download from the above link for stable version
if _has docker; then
  # Removes stopped/quit containers
  alias dockerrm='docker rm $(docker ps -aq)'
  # Removes images that are not associated with running containers
  alias dockerrmi='docker rmi $(docker images -q)'
fi

# kubectl controls kubernetes cluster (running via docker for mac)
# See docker for install link
if _has kubectl; then
  # Launch kubectl with the cache directory set to a proper cache dir
  alias kubectl='kubectl --cache-dir $XDG_CACHE_HOME/kube/http --kubeconfig $XDG_CONFIG_HOME/kube/config'
fi

# gpg manages my ssh sessions and secret keys
# https://github.com/gpg/gnupg
#
# brew install gpg
if _has gpg; then
  # Launches gpg with config
  #
  # => --homedir sets a config file directory using the XDG directory spec to keep ~ clean
  alias gpg='gpg --homedir $XDG_CONFIG_HOME/gnupg'
fi

# rg or ripgrep is a grep that searches recursively and respects my .gitignore files
# https://www.github.com/BurntSushi/ripgrep
#
# brew install ripgrep
if _has rg; then
  # Launches ripgrep with options:
  #
  # => --color makes sure we always have colours
  # => --hidden searches hidden files too
  alias grep='rg --hidden --color always'
# If we don't have ripgrep installed then set the following alias
else
  # Grep now does colours if we don't have ripgrep installed
  alias grep='grep --color=auto'
fi

# VSCode is an editor I rarely use, but the remote pair programming tool is great for interviews
# https://code.visualstudio.com/docs/?dv=osx
#
# See above for install link
if _has code; then
  # Launch code with XDG directories specified for data and extensions
  alias code='code --user-data-dir $XDG_CONFIG_HOME/vscode --extensions-dir $XDG_RUNTIME_DIR/vscode/extensions'
fi
