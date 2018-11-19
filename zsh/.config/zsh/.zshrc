ZSH_CONFIG_DIR="$XDG_CONFIG_HOME"/zsh

for config (${ZSH_CONFIG_DIR}/*.zsh) source $config

# GPG Stuff for ssh-agent handling
gpgconf --launch gpg-agent export GPG_TTY=$(tty) export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
