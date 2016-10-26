######
# .bashrc
# 
# Save file to home directory

###
# Use vi mode 
#
set -o vi

###
# Virtualenvwrapper
#
source /usr/local/bin/virtualenvwrapper.sh

###
# Bash
#

# enable programmable completion features
if ! shopt -oq posix; then
 if [ -f /usr/share/bash-completion/bash_completion ]; then
   . /usr/share/bash-completion/bash_completion
 elif [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
 fi
fi

# Path
PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/mysql-5.7.13-osx10.11-x86_64/bin/mysql_config:/usr/local/mysql/bin

# PS1
# Enclose all non-printable bytes in \[ \], or else prompt size will be diminished!!
PS1='[\[\e[38;5;129m\]\u\[\e[38;5;132m\]@\[\e[38;5;135m\]\h \[\e[38;5;160m\]\W\[\e[0m\]]\[\e[38;5;208m\]$(__git_ps1)\[\e[38;5;226m\]\$\[\e[0m\] '


###
# Git
#

# Copy /usr/share/git/completion/git-prompt.sh file to home (or ln -s) for git PS1
source ~/.git-prompt.sh

# Copy /usr/share/git/completion/git-completion.bash file to home (or ln -s) for git completion 
source ~/.git-completion.bash

# Show * or + in PS1 for working tree state
GIT_PS1_SHOWDIRTYSTATE=1


###
# Aliases
#

# Basics
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -liha'
# git
alias gd='git diff'
alias gs='git status'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glh='gl | head'
alias gds='git diff --staged'
alias gca='git commit --amend -C HEAD'
# Miscellaneous
alias weather='curl -4 http://wttr.in/Montreal?m'

###
# Exports
#

export PATH
export PS1
export GIT_PS1_SHOWDIRTYSTATE
