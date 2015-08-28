#alias ls="ls -G"
alias ls="ls --color=auto"
alias tmux="tmux -u"
#TERM="screen-256color"
export LSCOLORS=gxfxcxdxbxegedabagacad
export LANG=en_US.UTF-8
export LESSCHARSET=utf-8
export EDITOR="emacs"
alias emacs="emacs -nw"

# tkl path

#export LD_LIBRARY_PATH=$HOME/local/lib:$HOME/local/lib64:$LD_LIBRARY_PATH
#export PATH=$HOME/disk/local/bin:$HOME/local/bin:$HOME/local/aribin:$PATH
#export PYTHONPATH=/home/ysuzuki/local/arilib/python2.7
#export PYTHONSTARTUP=/home/ysuzuki/.pythonstartup
#export PKG_CONFIG_PATH=$HOME/local/lib/pkgconfig

# mac path
#export PATH=$HOME/local/bin:/usr/local/bin:$PATH # home brew path /usr/local/bin

# mecab path
export PATH=$PATH:$HOME/tagExtractor/mecablocal/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/tagExtractor/mecablocal/lib
export PYTHONPATH=$PYTHONPATH:$HOME/tagExtractor/mecablocal/lib/python2.7/site-packages

#history by tanikawa
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=100000

# git settings
source $HOME/local/arilib/git/git-prompt.sh #change by each environment
source $HOME/local/arilib/git/git-completion.bash #change by each environment
GIT_PS1_SHOWDIRTYSTATE=true

#prompt
PS1_YELLOW_BEGIN='\[\e[0;33m\]'
PS1_WHITE_BEGIN='\[\e[0;37m\]'
PS1_COLOR_END='\[\e[m\]'

#tmp
PS1="${PS1_YELLOW_BEGIN}\u@\h${PS1_COLOR_END}:${PS1_WHITE_BEGIN}\w \$(__git_ps1 "[%s]") ${PS1_COLOR_END}\n\$ "
#PS1="${PS1_YELLOW_BEGIN}\u@\h${PS1_COLOR_END}:${PS1_WHITE_BEGIN}\w  ${PS1_COLOR_END}\n\$ "

#aliases
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

#prevent tty from stopping
#stty stop undef
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export GIT_SSL_NO_VERIFY=1 #temp in new-comer training?

#specify
tera_user='suzukiyu01'
tera_pass='fushigidane7R#h'
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/dist-packages:/usr/lib/python2.7/dist-packages
