# (c) Dalton Serey
# Enviroment configuration
# .bashrc
#
# The `.bashrc` file is used to set up the environment for
# interactive BASH sessions. It is supposed to be executed
# whenever an interactive session is started, such as a new
# terminal. To make sure it is also executed at login sessions
# (such as ssh), it is a good idea to source `.bashrc` from
# `.bash_profile`.
#
# There is one particular feature I want this script to have: it
# should be the same for every unix-like environment. To cope
# with this, this particular file is supposed to contain only the
# configuration that applies equally to every bash environment.
# At the end, this script invokes complementary, OS specific
# scripts, currently named `.bashrc-osx` and `.bashrc-linux`
# where more specific configuration can be put.

# terminal colors
RESET="\033[0m"
LGREEN="\033[1;32m"
WHITE="\033[1;37m"
BWHITE="\033[4;37m"
BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
BROWN="\033[0;33m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
LGRAY="\033[0;37m"
DGRAY="\033[1;30m"
LRED="\033[1;31m"
LGREEN="\033[1;32m"
YELLOW="\033[1;33m"
LBLUE="\033[1;34m"
LPURPLE="\033[1;35m"
LCYAN="\033[1;36m"
WHITE="\033[1;37m"


# aliases
alias ls='ls --color'
alias h='cd $WORK'
alias l='ls -lF'
alias c='clear'
alias ip='curl ipinfo.io/ip'
alias mkv='python3 -m venv venv'
alias g='git'
alias gb='git branch -vv' 
alias gs='git status' 
alias gl='git log --graph --oneline --branches -20'
alias glm='gl ^master'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdt='git difftool'
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gr='git restore'
alias grs='git restore --staged'
alias gp='git push'
alias html-minifier='html-minifier --collapse-boolean-attributes --collapse-whitespace --decode-entities --minify-css --minify-js --process-conditional-comments --remove-attribute-quotes --remove-comments --remove-empty-attributes --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-style-link-type-attributes --trim-custom-fragments --use-short-doctype --'
alias a='source *venv/bin/activate'
alias d=deactivate
alias v="which python | sed 's/\/Users\/dalton/~/;s/\/venv\/bin\/python//'"


# functions
function activate {
    source venv/bin/activate
}

function regid {
    printf $1 | sha1sum
}


# set vi mode in bash
set -o vi


# Source cdd
[[ -e ~/.cdd/cdd.sh ]] && source ~/cdd/cdd.sh

export EDITOR=/usr/bin/vim

# https://askubuntu.com/questions/466198/how-do-i-change-the-color-for-directories-with-ls-in-the-console
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# comentado por dalton... talvez seja necessário recolocar
# acho que gcloud usa python2
export CLOUDSDK_PYTHON=$(which python)


# set PATH
export PATH=$PATH:~/.node/bin
export PATH=~/bin:~/Dropbox/prog1/bin:$PATH

# set WORK HOME director (see h alias)
export WORK=~/epol

case "$OSTYPE" in
    "darwin"*) [[ -f ~/.bashrc-osx ]] && source ~/.bashrc-osx ;;
    "linux"*) [[ -f ~/.bashrc-linux ]] && source ~/.bashrc-linux ;;
    *) echo "AVISO: nenhum .bashrc-$OSTYPE executado" ;;
esac

[[ -e ~/.bashrc-local ]] && source ~/.bashrc-local
