# Path modification

# Add brew files and other /usr/local/stuff to path
export PATH="/usr/local/lib:/usr/local/bin:/usr/local/sbin:$PATH"

# Add npm bin directory to path
export PATH="/Users/lewis/.local/share/npm/bin:$PATH"

# Add global node install to path
export PATH="$HOME/n/bin:$PATH"

# Add rust toolchain/cargo to path
export PATH="$CARGO_HOME/bin:$PATH"

# Add custom bin directories to path
export PATH="$HOME/bin:$PATH"

# Gopath variable because I want to put it inside dev
export GOPATH="$HOME/dev/lewiscowper/go"
export GOBIN="$GOPATH/bin"

# Add that GOBIN directory to the path
export PATH="$GOBIN:$PATH"
