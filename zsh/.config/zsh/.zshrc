ZSH_CONFIG_DIR="$XDG_CONFIG_HOME"/zsh

for config (${ZSH_CONFIG_DIR}/*) source $config

# GPG Stuff for ssh-agent handling
gpgconf --launch gpg-agent

echo "UPDATESTARTUPTTY" | gpg-connect-agent > /dev/null 2>&1
