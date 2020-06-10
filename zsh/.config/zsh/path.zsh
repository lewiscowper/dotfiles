# Path modification

# Use gnu versions of tools ahead of anything else
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

# Add brew files and other /usr/local/stuff to path
PATH="/usr/local/lib:/usr/local/bin:/usr/local/sbin:$PATH"

# Add npm bin directory to path
PATH="$XDG_DATA_HOME/npm/bin:$PATH"

# Add rust toolchain/cargo to path
PATH="$CARGO_HOME/bin:$PATH"

# Add ruby toolchain to path
PATH="/usr/local/opt/ruby/bin:$PATH"
PATH="$GEM_HOME/bin:$PATH"

# Add custom bin directories to path
PATH="$HOME/bin:$PATH"

# Add custom tmux scripts to path
PATH="$HOME/bin/tmux:$PATH"

# Add custom work scripts to path
PATH="$HOME/bin/work:$PATH"

# Add custom kubectl scripts to path
PATH="$HOME/bin/kubectl:$PATH"

export GOPATH="$HOME/bin/go"
export GOBIN="${GOPATH//://bin:}/bin"

# Add that GOBIN directory to the path
PATH="$GOBIN:$PATH"

# Add ncurses from brew to the path
PATH="/usr/local/opt/ncurses/bin:$PATH"

# Add helm@2 from brew ahead of helm@3
PATH="/usr/local/opt/helm@2/bin:$PATH"

export PATH
