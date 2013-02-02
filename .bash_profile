# aliases
alias ls="ls -FG"
alias diff="colordiff"
alias vi="vim"

# functions
# convert unix timestamps to human-readable
function unixtime {
  perl -e "require 'ctime.pl'; print &ctime($1);"
}

# parses the active branch name if a git repo is present
function git_branch {
  git branch --no-color 2> /dev/null | fgrep '*' | sed 's/* //'
}

# overload cd to re-export ps1 each time
function cd {
  builtin cd "$@" && export_prompt
}

function export_prompt {
  export PS1="\[$(tput bold)\]\[$(tput setaf 4)\]\w \[$(tput setaf 3)\]$(git_branch)> \[$(tput sgr0)\]"
}

# set ps1
export_prompt

# rvm crap
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
