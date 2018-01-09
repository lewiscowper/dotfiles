autoload -Uz promptinit
promptinit
autoload -Uz vcs_info

_newline=$'\n'
branch_name="${PR_BOLD_WHITE}%b%f"
prompt_symbol="||>"

zstyle ':vcs_info:*' stagedstr '${PR_GREEN}•'
zstyle ':vcs_info:*' unstagedstr '${PR_YELLOW}•'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git

precmd () {
  if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
    zstyle ':vcs_info:*' formats "${branch_name} %c%u%f"
  } else {
    zstyle ':vcs_info:*' formats "${branch_name} ${PR_RED}•%c%u%f"
  }

  vcs_info

  PROMPT="${_newline}${PR_MAGENTA}%~/%b%f ${vcs_info_msg_0_}${_newline}%(?.${PR_BLUE}.${PR_RED})${prompt_symbol}%f "
}

