alias ls='ls -G'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --colour=auto'
alias rm=trash
alias vim=nvim
alias untar='tar xvf'
alias tmux='TERM=xterm-256color tmux -2 -f $XDG_CONFIG_HOME/tmux/conf'
alias weechat='weechat -d $XDG_CONFIG_HOME/weechat'
alias gpg='gpg --homedir $XDG_CONFIG_HOME/gnupg'
alias sz='source ~/.zshrc'
alias release='echo "release-$(date +%y%V).0"'
alias week='date +%V'
alias sudo='sudo '
alias clean-docker-containers='docker rm $(docker ps -aq)'
alias clean-docker-images='docker rmi $(docker images -q)'
alias clean-selenium="kill $(ps aux | grep 'selenium-standalon[e]' | awk '{print $2}')"
