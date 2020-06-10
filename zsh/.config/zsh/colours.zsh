autoload colors; colors

# The variables are wrapped in %{%}. This should be the case for every
# variable that does not contain space.
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
  eval PR_$COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
  eval PR_BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

eval RESET='$reset_color'
export PR_RED PR_GREEN PR_YELLOW PR_BLUE PR_WHITE PR_BLACK
export PR_BOLD_RED PR_BOLD_GREEN PR_BOLD_YELLOW PR_BOLD_BLUE
export PR_BOLD_WHITE PR_BOLD_BLACK

# Where possible colours should be used
export CLICOLOR=1

# LSCOLORS The value of this variable describes what color to use for which attribute when colors
# are enabled with CLICOLOR. This string is a concatenation of pairs of the format fb, where f is
# the foreground color and b is the background color.
#
# The color designators are as follows:
#
# a black
# b red
# c green
# d brown
# e blue
# f magenta
# g cyan
# h light grey
# A bold black, usually shows up as dark grey
# B bold red
# C bold green
# D bold brown, usually shows up as yellow
# E bold blue
# F bold magenta
# G bold cyan
# H bold light grey; looks like bright white
# x default foreground or background
#
# Note that the above are standard ANSI colors. The actual display may differ depending on the color
# capabilities of the terminal in use.
#
# The order of the attributes are as follows:
#
# 1. directory
# 2. symbolic link
# 3. socket
# 4. pipe
# 5. executable
# 6. block special
# 7. character special
# 8. executable with setuid bit set
# 9. executable with setgid bit set
# 10. directory writable to others, with sticky bit
# 11. directory writable to others, without sticky bit
#
# The default is “exfxcxdxbxegedabagacad”, i.e. blue foreground and default background for regular
# directories, black foreground and red background for setuid executables, etc.

export LSCOLORS='gxfxcxdxbxgegdabagacad'

# Enable color in grep
export GREP_COLOR='3;36'


