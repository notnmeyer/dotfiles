if ! type __git_ps1 &> /dev/null && [ -e $HOME/.git-prompt.sh ]; then
  . $HOME/.git-prompt.sh
fi

if type __git_ps1 &> /dev/null; then
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWUNTRACKEDFILES=1
  export GIT_PS1_SHOWCOLORHINTS=1
  export PROMPT_DIRTRIM=2
  export PROMPT_COMMAND='__git_ps1 "\w" "\\\$ "'
fi
