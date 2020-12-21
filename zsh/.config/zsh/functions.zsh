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

portcheck() {
  lsof -i tcp:$1
}

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

portForward() {
  local arg=$1
  local serviceName=$(kg svc -l $arg | awk 'FNR==2 { print $1 }')
  local port=$(kg svc -l $arg | awk 'FNR==2 { print $5 }' | awk -F '/' '{ print $1 }')
  kubectl port-forward svc/$serviceName $port
}

function jwt() {
  for part in 1 2; do
    b64="$(cut -f$part -d. <<< "$1" | tr '_-' '/+')"
    len=${#b64}
    n=$((len % 4))
    if [[ 2 -eq n ]]; then
      b64="${b64}=="
    elif [[ 3 -eq n ]]; then
      b64="${b64}="
    fi
    d="$(openssl enc -base64 -d -A <<< "$b64")"
    echo "$d" | jq '.'
    # don't decode further if this is an encrypted JWT (JWE)
    if [[ 1 -eq part ]] && grep '"enc":' <<< "$d" >/dev/null ; then
        exit 0
    fi
  done
}

pipeline() {
  local projectDir=$(git rev-parse --show-toplevel | sd -p -s "/Users/$USER/dev/" "" | sed "s/\//%2F/g")
  local gitBranch=$(git branch --show-current)
  local url="$GITLAB_URL"/projects/"$projectDir"/pipelines

  if [[ -n "$1" ]]; then
    echo "Attempting to retry pipeline ID $1"
    curl -H "Private-Token:$GITLAB_TOKEN" -sS -X POST "$url/"$1"/retry" |\
      jq -r '{ "id": .id, "status": .status, "web_url": .web_url, "created_at": .created_at }'
  fi

  if [ -z "$GITLAB_TOKEN" ]; then
    echo "You need to authenticate for this, set the GITLAB_TOKEN variable to get past this hurdle, it needs api scopes"
    return 1
  fi

  if [ -z "$gitBranch" ]; then
    echo "Not a git repository, exiting"
    return 1
  fi

  curl -H "Private-Token:$GITLAB_TOKEN" -sS "$url" | \
    jq --arg BRANCH="$gitBranch" '.[] | select(.ref==$BRANCH)' | \
    jq '.[0]'
}

watchPipeline() {
  local jobId=$(pipeline "$@" | jq -r '.id')
  local ref=$(pipeline "$@" | jq -r '.ref')
  local localCommit=$(git rev-parse HEAD)
  local commit=$(pipeline "$@" | jq -r '.sha')

  local breakPoint=false
  local commitDiff="is running a different commit from your most recent\n(They have $commit, you have $localCommit)"

  if [[ "$localCommit" == "$commit" ]]; then
    commitDiff="is running the latest commit from your branch"
  fi

  echo "Pipeline has id: $jobId, and ref: $ref and $commitDiff"

  while [[ "$breakPoint" != true ]]; do
    echo -e "\t $jobId has status: $(pipeline "$@" | jq -r '.status')"

    local jobStatus=$(pipeline "$@" | jq -r '.status')
    if [[ $jobStatus == "success" || $jobStatus == "failed" || $jobStatus == "canceled" || $jobStatus == "skipped" ]]; then
      breakPoint=true
    else
      sleep 5
    fi
  done

  local jobStatus=$(pipeline "$@" | jq -r '.status')

  echo "Pipeline complete with status: $jobStatus"
  if [[ $jobStatus == "failed" ]]; then
    return 1
  fi
}
