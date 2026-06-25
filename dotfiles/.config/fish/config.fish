# homebrew bins are handled by `brew shellenv` below, so they're not listed here.
fish_add_path -g \
    "$HOME/.cargo/bin" \
    "$HOME/.bun/bin" \
    "$HOME/bin" \
    "$HOME/go/bin" \
    "$HOME/.local/bin" \
    /home/linuxbrew/.linuxbrew/bin

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

        # setting up completions is necessary if fish wasnt installed by homebrew.
        # brew shellenv (above) already exported $HOMEBREW_PREFIX, so reuse it
        # instead of shelling out to `brew --prefix` on every startup.
        if test -d "$HOMEBREW_PREFIX/share/fish/completions"
            set -p fish_complete_path "$HOMEBREW_PREFIX/share/fish/completions"
        end

        if test -d "$HOMEBREW_PREFIX/share/fish/vendor_completions.d"
            set -p fish_complete_path "$HOMEBREW_PREFIX/share/fish/vendor_completions.d"
        end

        break
    end
end

if type -q zoxide
    zoxide init fish | source
end

if type -q mise
    mise activate fish | source
    # if mise is installed with fish, the completions should be lazy loaded automatically.
end

if type -q starship
    starship init fish | source
end

if type -q direnv
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
