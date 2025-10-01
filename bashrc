# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# some more ls aliases
alias ll='eza -alF --icons'
alias la='ls -A'
alias l='ls -CF --icons'

# I like to start tunes from the shell.
alias soma_fluid="mplayer http://ice2.somafm.com/fluid-128-mp3"
alias soma_groove="mplayer http://ice5.somafm.com/groovesalad-256-mp3"
alias kcrw="mplayer https://kcrw.streamguys1.com/kcrw_192k_mp3_e24_internet_radio"
alias wnxp="mplayer File path : http://wpln.streamguys.org/wnxpfm.mp3"
alias wfcl="mplayer http://wpln.streamguys.org/wfclfm.mp3"


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions. Not checked into git.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Create a tmux session named after the current directory.
alias ctmux='tmux new-s -s $(basename `pwd`)'

export GPG_TTY=$(tty)

alias gd=git diff
alias gs=git status
