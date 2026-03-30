export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

plugins=(git zsh-autosuggestions)

PROMPT="%n %2~ %B:)%b "
RPROMPT="%U %m%u"

alias tm='tmux new -As `basename $PWD`'
alias vim=nvim
alias gafc='git status && git add . && git commit --amend --no-edit --no-verify && git push --force-with-lease --no-verify'
