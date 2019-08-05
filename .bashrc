# MAC setting
alias ls="ls -G"
alias tmux="tmux -u"
## home brew path /usr/local/bin
export PATH=$HOME/local/bin:/usr/local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$HOME/local/lib64:$LD_LIBRARY_PATH

# Linux setting
#alias ls="ls --color=auto"
#TERM="screen-256color"
#export LSCOLORS=gxfxcxdxbxegedabagacad
#export LC_ALL=en_US.UTF-8
#export LANG=en_US.UTF-8
#export LESSCHARSET=utf-8

# mecab path
#export PATH=$PATH:$HOME/tagExtractor/mecablocal/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/tagExtractor/mecablocal/lib
#export PYTHONPATH=$PYTHONPATH:$HOME/tagExtractor/mecablocal/lib/python2.7/site-packages

# #history by tanikawa
#shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=10000

# # synchronize .bash_histoory frequently
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend

# git settings
source $HOME/dotfiles/git-prompt.sh #change by each environment
source $HOME/dotfiles/git-completion.bash #change by each environment
GIT_PS1_SHOWDIRTYSTATE=true

#prompt
PS1_YELLOW_BEGIN='\[\e[0;33m\]'
PS1_WHITE_BEGIN='\[\e[0;37m\]'
PS1_COLOR_END='\[\e[m\]'

#tmp
PS1="${PS1_YELLOW_BEGIN}\u@\h${PS1_COLOR_END}:${PS1_WHITE_BEGIN}\w \$(__git_ps1 "[%s]") ${PS1_COLOR_END}\n\$ "
#PS1="${PS1_YELLOW_BEGIN}\u@\h${PS1_COLOR_END}:${PS1_WHITE_BEGIN}\w  ${PS1_COLOR_END}\n\$ "

# aliases for safe
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

#prevent tty from stopping
#stty stop undef
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

#specify
#export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/dist-packages:/usr/lib/python2.7/dist-packages

# Laravel (composer)
export PATH=$PATH:$HOME/.composer/vendor/bin

# pyenv
# https://qiita.com/1000ch/items/93841f76ea52551b6a97
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
