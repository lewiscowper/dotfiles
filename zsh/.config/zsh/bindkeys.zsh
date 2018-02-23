bindkey "^K"      kill-whole-line                      # ctrl-k
bindkey "^R"      history-incremental-search-backward  # ctrl-r
bindkey "^A"      beginning-of-line                    # ctrl-a
bindkey "^E"      end-of-line                          # ctrl-e
bindkey "[B"      history-search-forward               # down arrow
bindkey "[A"      history-search-backward              # up arrow
bindkey "^D"      delete-char                          # ctrl-d
bindkey "^F"      forward-char                         # ctrl-f
bindkey "^B"      backward-char                        # ctrl-b
bindkey -s "^G"   'git status^M'                       # ctrl-g
bindkey -s "^W"   'cd ~/dev/moneymap/web-app^M'        # ctrl-w
bindkey -s "^O"   'cd ~/dev/moneymap/ops-tool^M'        # ctrl-w
bindkey -s "^Mc"  'git checkout -b MMP-'               # ctrl-m-c

bindkey -v # Default to standard vi bindings, regardless of editor string
