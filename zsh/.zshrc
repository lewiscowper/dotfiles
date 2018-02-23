ZSH_CONFIG_DIR=~/.config/zsh

for config (${ZSH_CONFIG_DIR}/*.zsh) source $config

# external sourcing here
if [ -f "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh; fi
if [ -f "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; fi
