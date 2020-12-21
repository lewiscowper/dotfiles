# Path modification

# Function to conditionally add only if non existent
function addToPATH {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

addToPATH /Applications/AIRSDK_Compiler/bin
addToPATH ~/.local/lib/npm/bin

# Use gnu versions of tools ahead of anything else
addToPATH /usr/local/opt/grep/libexec/gnubin

# Add brew files and other /usr/local/stuff to path
addToPATH /usr/local/lib
addToPATH /usr/local/bin
addToPATH /usr/local/sbin

# Add npm bin directory to path
addToPATH "$XDG_DATA_HOME"/npm/bin

# Add rust toolchain/cargo to path
addToPATH "$CARGO_HOME"/bin

# Add ruby toolchain to path
addToPATH /usr/local/opt/ruby/bin
addToPATH "$GEM_HOME"/bin

# Add custom bin directories to path
addToPATH "$HOME"/bin

# Add custom tmux scripts to path
addToPATH "$HOME"/bin/tmux

# Add custom work scripts to path
addToPATH "$HOME"/bin/work

export GOPATH="$HOME/bin/go"
export GOBIN="${GOPATH//://bin:}/bin"

# Add that GOBIN directory to the path
addToPATH "$GOBIN"

# Add ncurses from brew to the path
addToPATH /usr/local/opt/ncurses/bin

# Add helm@2 from brew ahead of helm@3
addToPATH /usr/local/opt/helm@2/bin

# Add python2 pip packages
addToPATH "$HOME"/Library/Python/2.7/bin

# Add krew (kubectl plugin manager)
addToPATH "$KREW_ROOT"/bin

export PATH
