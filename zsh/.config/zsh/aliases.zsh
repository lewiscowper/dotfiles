# little editor shorthands, e for edit directly in terminal, g for "graphically edit"
alias e="$EDITOR"
alias vim="nvim"

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

# cp and mv are now "interactive", aka will prompt before overwrite
alias cp='cp -i'
alias mv='mv -i'

# Lovely ls replacement that adds colours and icons and so on
# https://github.com/athityakumar/colorls
# Need a powerline patched font
#
# gem install colorls
if _has colorls; then
  alias ls='colorls -A --sd'
fi

# A lovely cat replacement written in Rust
# https://github.com/sharkdp/bat
# Supports syntax highlighting and paging and so on
#
# brew install bat
if _has bat; then
  alias cat='bat'
fi

# Tmux manages my workflow and sessions
# https://github.com/tmux/tmux
#
# brew install tmux
if _has tmux; then
  # Shorthand to attach to a session by tag, e.g. ta <tag>
  alias ta="tmux attach -t"
  # Shorthand to create a new session by name, e.g. tn <name>
  alias tn="tmux new-session -s"
  # Shorthand to list all sessions
  alias tls="tmux list-sessions"
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

# tldr is a neat help tool trying to simplify man pages with useful examples
# https://tldr.sh
#
# brew install tldr
if _has tldr; then
  # Set up a help alias to see usage
  alias help='tldr'
else
  alias help='man'
fi

# Neomutt is a console mail client
# https://neomutt.org
#
# brew install neomutt/neomutt/neomutt --with-gpgme --with-libidn --with-notmuch-patch --with-s-lang
if _has neomutt; then
  # Sets an alias that moves the config directory out of ~/.subversion
  alias mutt='neomutt'
fi
