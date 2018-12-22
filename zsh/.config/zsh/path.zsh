# Path modification

# Add brew files and other /usr/local/stuff to path
export PATH="/usr/local/lib:/usr/local/bin:/usr/local/sbin:$PATH"

# Add npm bin directory to path
export PATH="$XDG_DATA_HOME/npm/bin:$PATH"

# Add rust toolchain/cargo to path
export PATH="$CARGO_HOME/bin:$PATH"

# Add ruby toolchain to path
export PATH="$GEM_HOME/bin:$PATH"

# Add custom bin directories to path
export PATH="$HOME/bin:$PATH"

# Add custom tmux scripts to path
export PATH="$HOME/bin/tmux:$PATH"

# Gopath variable because I want to put it inside dev
export GOPATH="$DEV_DIR/go"
export GOBIN="$GOPATH/bin"

# Add that GOBIN directory to the path
export PATH="$GOBIN:$PATH"
