#alias ls="ls --color=auto --ignore-backups"
alias ls="ls -G"
alias tmux="tmux -u"
#TERM="screen-256color"
export LSCOLORS=gxfxcxdxbxegedabagacad
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export PATH=$HOME/disk/local/bin:$HOME/local/bin:$PATH:$HOME/local/aribin

#lib64はpypyで追加
#export LD_LIBRARY_PATH=$HOME/local/lib
#export LD_LIBRARY_PATH=$HOME/local/lib64:$LD_LIBRARY_PATH

#export PYTHONPATH=/home/ysuzuki/local/arilib/python2.7
#export PYTHONSTARTUP=/home/ysuzuki/.pythonstartup
#export PKG_CONFIG_PATH=$HOME/local/lib/pkgconfig

#history by tanikawa
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=100000

#prompt

#aliases
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

#prevent tty from stopping
stty stop undef
