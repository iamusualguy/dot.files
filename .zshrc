plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

PROMPT="%n %2~ %B:)%b "
RPROMPT="%U %m%u"

alias tm='tmux new -As `basename $PWD`'
alias vim=nvim;
