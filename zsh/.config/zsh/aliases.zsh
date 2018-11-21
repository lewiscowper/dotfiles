alias ls='colorls -l -A --sd'
alias cat='bat'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --colour=auto'
alias vim=nvim
alias e="$EDITOR"
alias ta="tmux attach -t"
alias tn="tmux new-session -t"
alias tls="tmux list-sessions"
alias untar='tar xvf'
alias tmux='TERM=xterm-256color tmux -2 -f $XDG_CONFIG_HOME/tmux/conf'
alias weechat='weechat -d $XDG_CONFIG_HOME/weechat'
alias gpg='gpg --homedir $XDG_CONFIG_HOME/gnupg'
alias sz='source ~/.zshrc'
alias release='echo "release-$(date +%y%V).0"'
alias sudo='sudo '
alias clean-docker-containers='docker rm $(docker ps -aq)'
alias clean-docker-images='docker rmi $(docker images -q)'
alias clean-selenium="kill $(ps aux | grep 'selenium-standalon[e]' | awk '{print $2}')"
alias did="vim +'normal Go' +'r!date' ~/did.txt"
alias code='code --user-data-dir $XDG_CONFIG_HOME/vscode --extensions-dir $XDG_RUNTIME_DIR/vscode/extensions'
alias kubectl='kubectl --cache-dir $XDG_CACHE_HOME/kube/http'
alias grep='rg --color always'
alias procs='ps aux | grep -i'
