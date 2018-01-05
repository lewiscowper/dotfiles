ZSH_CONFIG_DIR=~/dotfiles/zsh/.config/zsh

if [ -n "$(/bin/ls ${ZSH_CONFIG_DIR})" ]; then
  for dotfile in ${ZSH_CONFIG_DIR}/*
  do
    if [ -r "${dotfile}" ]; then
      source "${dotfile}"
    fi
  done
fi

# external sourcing here
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
