# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"
# End of LM Studio CLI section

# homebrew
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # brew's completions must be on fpath before compinit runs
  if [ -d "$(brew --prefix)/share/zsh/site-functions" ]; then
    fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
  fi
fi

# mise
if command -v mise >/dev/null; then
  eval "$(mise activate zsh)"

  # completions — fpath must be set before compinit runs
  mkdir -p "$HOME/.zfunc"
  mise completion zsh > "$HOME/.zfunc/_mise"
  fpath=("$HOME/.zfunc" $fpath)
fi

autoload -Uz compinit && compinit
