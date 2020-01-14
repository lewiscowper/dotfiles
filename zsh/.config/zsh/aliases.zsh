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
alias ls='gls --color -h --group-directories-first'

if _has git; then
  alias g='git'
  alias ga='git add'
  alias gb='git branch'
  alias gc='git commit'
  alias gcl='git clone'
  alias gcm='git commit --message'
  alias gco='git checkout'
  alias gcob='git checkout -b'
  alias gcom='git checkout master'
  alias gd='git diff'
  alias gi='git init'
  alias glg='git log --graph --oneline --decorate --all'
  alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
  alias gp='git pull'
  alias gpom='git pull origin master'
  alias gr='git rebase'
  alias gs='git status'
  alias gst='git stash'
  alias gsta='git stash apply'
fi

# Kubernetes cli
# https://github.com/kubernetes/kubernetes
#
# brew install kubernetes-cli
if _has kubectl; then
  alias k='kubectl'
  alias kg='kubectl get'
  alias kgp='kubectl get pods'
  alias kgd='kubectl get deploy'
  alias kgi='kubectl get ingress'
  alias kgs='kubectl get svc'
  alias kgsc='kubectl get secret -o yaml'
  alias kgst='kubectl get statefulsets.apps'
  alias kgr='kubectl get rs'
  alias kgpv='kubectl get pvc'
  alias kd='kubectl delete'
  alias kdp='kubectl delete pods'
  alias kdi='kubectl delete ingress'
  alias kdd='kubectl delete deploy'
  alias kds='kubectl delete svc'
  alias kdsc='kubectl delete secret'
  alias kdst='kubectl delete statefulsets.apps'
  alias kdr='kubectl delete rs'
  alias kdpv='kubectl delete pvc'
  alias ke='kubectl exec -it'
  alias kl='kubectl logs'
  alias klf='kubectl logs -f'
  alias kv='kubectl describe'
  alias kvp='kubectl describe pods'
  alias kcn='kubectl config set-context $(kubectl config current-context) --namespace'
  alias kpf='kubectl port-forward'
fi

if _has helm; then
  alias h='helm'
  alias ht='helm template -f'
  alias hl='helm lint'
  alias hru='helm repo update'
  alias hdu='helm dep update'
  alias helm2='/usr/local/opt/helm@2/bin/helm'
fi

if _has ansible; then
  alias avd='ansible-vault decrypt'
  alias ave='ansible-vault encrypt'
fi

if _has curl; then
  alias weather='curl "wttr.in/?Q0"'
fi

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
  alias cat='PAGER=less bat'
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
