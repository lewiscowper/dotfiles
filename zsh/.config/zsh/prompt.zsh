# Allow for variable/function substitution in prompt
setopt prompt_subst

# Load color variables to make it easier to color things
autoload -U colors && colors

_newline=$'\n'
_lineup=$'\e[1A'
_linedown=$'\e[1B'
prompt_symbol="|>"

# The arrow symbol that is used in the prompt
PR_ARROW_CHAR="|>"

# The arrow in red (for root) or violet (for regular user)
function PR_ARROW() {
  echo "%(!.%{$fg[red]%}.%{$fg[violet]%})${PR_ARROW_CHAR}%{$reset_color%} "
}

# Set RHS prompt for git repositories
DIFF_SYMBOL="-"
GIT_PROMPT_SYMBOL=""
GIT_PROMPT_PREFIX="%{$fg[blue]%}%B⸤ %b%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[blue]%}%B ⸣%b%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[teal]%}%B+NUM%b%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[orange]%}%B-NUM%b%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg[cyan]%}%Bx%b%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg[red]%}%B$DIFF_SYMBOL%b%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg[yellow]%}%B$DIFF_SYMBOL%b%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg[green]%}%B$DIFF_SYMBOL%b%{$reset_color%}"
GIT_PROMPT_DETACHED="%{$fg[neon]%}%B!%b%{$reset_color%}"

# Show Git branch/tag, or name-rev if on detached head
function parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

function parse_git_detached() {
  if ! git symbolic-ref HEAD >/dev/null 2>&1; then
    echo "${GIT_PROMPT_DETACHED}"
  fi
}

# Show different symbols as appropriate for various Git repository states
function parse_git_state() {
  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
  GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    if [[ -n $GIT_STATE ]]; then
      GIT_STATE="$GIT_STATE "
    fi
  GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    if [[ -n $GIT_STATE ]]; then
      GIT_STATE="$GIT_STATE "
    fi
  GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard :/ 2> /dev/null) ]]; then
  GIT_DIFF=$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
  GIT_DIFF=$GIT_DIFF$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
  GIT_DIFF=$GIT_DIFF$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE && -n $GIT_DIFF ]]; then
    GIT_STATE="$GIT_STATE "
  fi
  GIT_STATE="$GIT_STATE$GIT_DIFF"

  if [[ -n $GIT_STATE ]]; then
  echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi
}

# If inside a Git repository, print its branch and state
RPR_SHOW_GIT=true # Set to false to disable git status in rhs prompt
function git_prompt_string() {
  if [[ "${RPR_SHOW_GIT}" == "true" ]]; then
    local git_where="$(parse_git_branch)"
    local git_detached="$(parse_git_detached)"
    [ -n "$git_where" ] && echo " $GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[white]%}%B${git_where#(refs/heads/|tags/)}%b$git_detached$GIT_PROMPT_SUFFIX"
  fi
}

# Prompt
function PCMD() {
  echo "${_newline}${PR_MAGENTA}%~/%b ${_newline}%(?.${PR_BLUE}.${PR_RED})$(PR_ARROW)%f " # space at the end
}

PROMPT='$(PCMD)' # single quotes to prevent immediate execution
RPROMPT='' # set asynchronously and dynamically

# Right-hand prompt
function RCMD() {
  echo "%{${_lineup}%}$(git_prompt_string)%{${_linedown}%}"
}

ASYNC_PROC=0
function precmd() {
  function async() {
  # save to temp file
  printf "%s" "$(RCMD)" > "${XDG_RUNTIME_DIR}/zsh-rprompt"

  # signal parent
  kill -s USR1 $$
  }

  # do not clear RPROMPT, let it persist

  # kill child if necessary
  if [[ "${ASYNC_PROC}" != 0 ]]; then
  kill -s HUP $ASYNC_PROC >/dev/null 2>&1 || :
  fi

  # start background computation
  async &!
  ASYNC_PROC=$!
}

function TRAPUSR1() {
  # read from temp file
  RPROMPT="$(cat ${XDG_RUNTIME_DIR}/zsh-rprompt)"

  # reset proc number
  ASYNC_PROC=0

  # redisplay
  zle && zle reset-prompt
}
