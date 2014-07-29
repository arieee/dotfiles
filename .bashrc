alias ls="ls --color=auto --ignore-backups"
alias emacs="/home/ysuzuki/local/bin/emacs"
alias tmux="tmux -u"
#TERM="screen-256color"
export LSCOLORS=gxfxcxdxbxegedabagacad
export LANG=en_US.UTF-8
export LESSCHARSET=utf-8
export PATH=$HOME/disk/local/bin:$HOME/local/bin:$PATH:$HOME/local/aribin

#lib64はpypyで追加
export LD_LIBRARY_PATH=$HOME/local/lib
export LD_LIBRARY_PATH=$HOME/local/lib64:$LD_LIBRARY_PATH

export PYTHONPATH=/home/ysuzuki/local/arilib/python2.7
export PYTHONSTARTUP=/home/ysuzuki/.pythonstartup
export PKG_CONFIG_PATH=$HOME/local/lib/pkgconfig

#history by tanikawa
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=100000

#prompt
PS1='\[\e[0;33m\]\u@\h\[\e[00m\]:\[\e[0;37m\]\w\$ \[\e[00m\]'

#aliases
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

#prevent tty from stopping
stty stop undef
