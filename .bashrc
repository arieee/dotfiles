alias ls="ls --color=auto --ignore-backups"
alias emacs="/home/ysuzuki/local/bin/emacs"
alias tmux="tmux -u"
#TERM="screen-256color"
export LSCOLORS=gxfxcxdxbxegedabagacad
export LANG=en_US.UTF-8
export LESSCHARSET=utf-8
export PATH=$HOME/disk/local/bin:$HOME/local/bin:$PATH:$HOME/local/aribin
export EDITOR="emacs"

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

# git settings
source $HOME/local/arilib/completion/git-prompt.sh #change by each environment
source $HOME/local/arilib/completion/git-completion.bash #change by each environment
GIT_PS1_SHOWDIRTYSTATE=true

#prompt
PS1_YELLOW_BEGIN='\[\e[0;33m\]'
PS1_WHITE_BEGIN='\[\e[0;37m\]'
PS1_COLOR_END='\[\e[m\]'

PS1="${PS1_YELLOW_BEGIN}\u@\h${PS1_COLOR_END}:${PS1_WHITE_BEGIN}\w \$(__git_ps1 "[%s]")\$ ${PS1_COLOR_END}"

#aliases
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

#prevent tty from stopping
stty stop undef
