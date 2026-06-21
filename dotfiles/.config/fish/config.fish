begin
  set -g fish_user_paths \
    "$HOME/.cargo/bin" \
    "$HOME/.bun/bin" \
    "$HOME/bin" \
    "$HOME/go/bin" \
    "$HOME/.local/bin" \
    "/opt/homebrew/bin" \
    "/usr/local/bin" \
    "$fish_user_paths"
end

#
# environment
#
set -gx EDITOR hx

if test (uname) = Darwin
  set -gx AWS_VAULT_BACKEND keychain
else
  set -gx AWS_VAULT_BACKEND file
end

# set up homebrew (macos /opt/homebrew or linux /home/linuxbrew), if installed.
# brew shellenv prepends brew's bin to PATH, so the prefix doesn't need to be hardcoded above.
for brew_path in /opt/homebrew/bin/brew /home/linuxbrew/.linuxbrew/bin/brew
  if test -x $brew_path
    eval ($brew_path shellenv)

    # setting up completions is necessary if fish wasnt installed by homebrew
    if test -d (brew --prefix)"/share/fish/completions"
      set -p fish_complete_path (brew --prefix)/share/fish/completions
    end

    if test -d (brew --prefix)"/share/fish/vendor_completions.d"
      set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end

    break
  end
end

if which zoxide >/dev/null
  zoxide init fish | source
end

if which mise >/dev/null
  mise activate fish | source
  mise completion fish | source
end

if which starship >/dev/null
  starship init fish | source
end

if which direnv >/dev/null
  direnv hook fish | source
end

if test -f "$HOME/.config/fish/conf.d/secrets.env"
  source "$HOME/.config/fish/conf.d/secrets.env"
end

#
# aliases
#

# git
alias ga 'git add'
alias gap 'git add -p'
alias gc 'git commit'
alias gd 'git diff'
alias gpr 'git pull --rebase'
alias gp 'git push -u origin (git branch --show-current)'
alias gs 'git status'

# kubectl
alias kcp 'kubectl config use-context production'
alias kcs 'kubectl config use-context staging'
alias kcu 'kubectl config unset current-context'
