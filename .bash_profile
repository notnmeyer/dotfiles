source $HOME/.secrets
source $HOME/.bin/git-prompt.sh
source $HOME/.bin/git-completion.bash

export EDITOR=vim
export HISTFILESIZE=99999999
export PS1='\n\[$(tput setaf 5)\]\h\[$(tput setaf 7)\] \[$(tput setaf 4)\]chef:$(chefvm current) \[$(tput setaf 7)\]\w\[$(tput setaf 2)\]$(__git_ps1 " [%s]") \[$(tput setaf 4)\]\n>\[$(tput sgr0)\] '
export PATH=/usr/local/git/bin:$HOME/.rbenv/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:/Applications/Postgres.app/Contents/MacOS/bin:$PATH

# git prompt support
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

# aliases
alias ls="ls -G"
alias diff="colordiff"
alias vi="vim"
alias be="bundle exec"

# git aliases
alias g="git"
alias gap="git add -p"
alias gpr="git pull --rebase"
alias gc="git commit"
alias ga="git add"
alias gd="git diff"
alias gco="git co"
alias gcl="git clone"
alias gm="git merge"
alias gp="git push"
alias gpo="git push origin"
alias gs="git status"

function glc {
  git log --pretty=format:"* %an: %s" -$1
}

# tunnels
alias m1t="ssh -Nn mini01-tunnel > /dev/null 2>&1 &"
alias m2t="ssh -Nn mini02-tunnel > /dev/null 2>&1 &"


# rbenv shit
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# chefvm shit
eval "$(/Users/nate/.chefvm/bin/chefvm init -)"

# test kitchen aliases
alias kis="kitchen setup"
alias kic="kitchen converge"
alias kil="kitchen list"
alias kid="kitchen destroy"
alias kiv="kitchen verify"
alias kilo="kitchen login"

# berks
alias b="berks"
alias bupload="berks upload"
alias bupdate="berks update"
alias bapply="berks apply"
alias bt="ssh -Nn berks-tunnel > /dev/null 2>&1 &"

# knife aliases/functions
alias ks="knife status"
alias knl="knife node list"
alias ksearch="knife search"
alias kssh="knife ssh"
alias kns="knife node show"
alias kdbs="knife data bag show"
alias kdbe="knife data bag edit"
alias kdbc="knife data bag create"

function s {
  knife search node node_name:$1 -a fqdn | grep fqdn | awk '{print $2}'
}

# bash autocomplete
bind 'Tab: menu-complete'
