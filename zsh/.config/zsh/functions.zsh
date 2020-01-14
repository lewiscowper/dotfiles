man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;36m") \
    LESS_TERMCAP_md=$(printf "\e[1;36m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;36m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;36m") \
      man "$@"
}

path() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           sub(\"/Users/lewis\", \"$fg_no_bold[red]~$reset_color\"); \
           print }"
}

peek() { tmux split-window -p 33 $EDITOR $@ || exit; }

events() {
  kubectl get events --watch \
  -o 'go-template={{.lastTimestamp}} ^ {{.involvedObject.kind}} ^ {{.message}} ^ ({{.involvedObject.name}}){{"\n"}}' \
  | awk -F^ \
  -v black=$(tput setaf 0) \
  -v red=$(tput setaf 1) \
  -v green=$(tput setaf 2) \
  -v yellow=$(tput setaf 3) \
  -v blue=$(tput setaf 4) \
  -v magenta=$(tput setaf 5) \
  -v cyan=$(tput setaf 6) \
  -v white=$(tput setaf 7) \
  '{
      $1=blue $1
      $2=green $2
      $3=white $3
  }
  1'
}

portcheck() {
  lsof -i tcp:$1
}
