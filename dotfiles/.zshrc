# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"
# End of LM Studio CLI section

# mise
if command -v mise >/dev/null; then
  eval "$(mise activate zsh)"

  # completions — fpath must be set before compinit runs
  mkdir -p "$HOME/.zfunc"
  mise completion zsh > "$HOME/.zfunc/_mise"
  fpath=("$HOME/.zfunc" $fpath)
fi

autoload -Uz compinit && compinit
