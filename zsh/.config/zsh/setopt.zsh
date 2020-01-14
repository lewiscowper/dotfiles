# Options

# If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt auto_cd

# Silence bell
setopt nobeep

# Allow comments in interactive shells
setopt interactive_comments

# History

# Allow multiple terminal sessions to all append to one zsh command history
setopt inc_append_history
setopt share_history

# Remove extra blanks from each command line being added to history
setopt hist_reduce_blanks

# Include more information about when the command was executed, etc
setopt extended_history

# Avoid duplicates in history
setopt hist_find_no_dups
setopt hist_ignore_all_dups

# Completion

# Allow completion from within a word/phrase
setopt complete_in_word

# Prompt

# Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt prompt_subst

# Only show right prompt on the current prompt
setopt transient_rprompt
