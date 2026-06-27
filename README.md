# dotfiles

```shell
mise bootstrap        # everything
mise dotfiles apply   # just relink dotfiles
mise install          # just tools
```
---

## first time setup

### homebrew
```shell
# homebrew — needed for casks
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install mise fish
git clone git@github.com:notnmeyer/dotfiles.git ~/code/dotfiles

### mise

set the machines env so the correct config.$MISE_ENV.toml file is included,
```shell
mkdir -p ~/.config/fish/conf.d
echo 'set -gx MISE_ENV (home|work|linux)' > ~/.config/fish/conf.d/mise.fish
```

mise bootstrap,
```shell
echo "set -gx MISE_ENV (home|work|linux) >> ~/.config/fish/conf.d/mise_env.fish"
cd ~/code/dotfiles/dotfiles
mise bootstrap
```
