# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# I like to start tunes from the shell.
alias soma_fluid="mplayer http://ice2.somafm.com/fluid-128-mp3"
alias soma_groove="mplayer http://ice5.somafm.com/groovesalad-256-mp3"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Include local bin for Ubuntu distros and virtualenv executables.
export PATH=$PATH:~/.local/bin

# Source virtual env wrapper if it's available.
if [[ ! -v VIRTUAL_ENV && -e ~/.local/bin/virtualenvwrapper.sh  ]]
then
    source ~/.local/bin/virtualenvwrapper.sh
fi

[[ $COLORTERM = gnome-terminal && ! $TERM = screen-256color ]] && TERM=xterm-256color

export TERM=xterm-256color

# Don't dump me into nano, ever, please.
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# Coloring for gnome terminal.
if [[ -e ~/.config/bash16-shell ]]
then
    BASE16_SHELL=$HOME/.config/base16-shell/
    [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
fi

# If we are using nvm, do the needful.
if [[ -e ~/.nvm ]]
then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# Preview: https://dom.hastin.gs/files/bash-ps1/#!terminal=XFtcZVs0OTs5Mm1cXSQoX19naXRfcHMxICIgWyVzXSIpIFxbXGVbMzg7NTsxOTdtXF1cdyBcW1xlWzM4OzU7MTQxbVxdXCRcW1xlWzBtXF0g&blink-cursor=1&colours=256&cursor=pipe
export PS1='\[\e[49;92m\]$(__git_ps1 " [%s]") \[\e[38;5;197m\]\w \[\e[38;5;141m\]\$\[\e[0m\] ';

# Create a tmux session named after the current directory.
alias ctmux='tmux new-s -s $(basename `pwd`)'

export GPG_TTY=$(tty)

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# If pyenv is install, instatiate.
if [[ -e $HOME/.pyenv ]]
then
    export PYENV_ROOT="$HOME/.pyenv"
    eval "$(pyenv init -)"
    export PATH="$PYENV_ROOT/bin:$PATH"
fi

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [[ -e $HOME/.tfenv ]]
then
    export PATH="$HOME/.tfenv/bin:$PATH"
fi
