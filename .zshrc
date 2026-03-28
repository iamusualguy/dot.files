export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

plugins=(git)

PROMPT="%n %2~ %B:)%b "
RPROMPT="%U %m%u"

alias tm='tmux new -As `basename $PWD`'
alias vim=nvim;
