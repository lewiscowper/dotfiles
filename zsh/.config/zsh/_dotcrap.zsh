# System/shell related exports

# Set up XDG_CONFIG user dirs in the most likely vain hope something looks for them
export XDG_DOWNLOAD_DIR="$HOME/tmp"
export XDG_CACHE_HOME="$HOME/.local/cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_RUNTIME_DIR="$HOME/.local/tmp"

# Remove .lesshst (Less's history file)
export LESSHISTFILE=-

# NODE_REPL_HISTORY sets the location of the node repl history, empty string disables persistent
# history
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node/node_history"

# move npm config file.
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# Move .babel.json (Babel's cache file, elsewhere)
export BABEL_CACHE_PATH="$XDG_CACHE_HOME/babel/babel.json"

# Move docker's config from .docker/
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# Helm variable for location of config
export HELM_HOME="$XDG_CONFIG_HOME/helm/helm"

# Move k8s config out of default location
export KUBECONFIG="$XDG_CONFIG_HOME/kube/config"

# Move rustup config from ~/.rustup
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# Move cargo data out of .cargo
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# Move weechat config from .weechat
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"

# Set up tmux's tmp directory
export TMUX_TMPDIR="$XDG_CACHE_HOME/tmux"

# Move atoms junk out of ~/.atom
export ATOM_HOME="$XDG_DATA_HOME/atom"

# Move aws-cli config out of ~/.aws
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"

# Move aws-cli credentials out of ~/.aws
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"

# Move gpg config files out of ~/.gnupg
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"

# Move spacemacs config files out of ~/.spacemacs or ~/.spacemacs.d/
export SPACEMACSDIR="$XDG_CONFIG_HOME/spacemacs"

# Move z.sh data out of ~/.z
export _Z_DATA="$XDG_CACHE_HOME/z"
