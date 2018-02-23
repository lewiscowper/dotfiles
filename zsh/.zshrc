export ZSH_CONFIG_DIR=~/.config/zsh

for config (${ZSH_CONFIG_DIR}/*.zsh) source $config

# external sourcing here
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
