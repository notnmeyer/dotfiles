# dotfiles

managed with [mise](https://mise.jdx.dev): packages, dotfiles, and macos defaults. two profiles, `home` and `work`.

## first time setup

```shell
# homebrew — needed for casks
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install mise
git clone git@github.com:notnmeyer/dotfiles.git ~/code/dotfiles

# bootstrap a profile
cd ~/code/dotfiles
mise bootstrap --env home|work
```

# set the machines env

so the correct mise.$MISE_ENV.toml file is included,

```shell
echo 'set -gx MISE_ENV home' > ~/.config/fish/conf.d/mise.fish
```

## apply changes

```shell
mise bootstrap        # everything
mise dotfiles apply   # just relink dotfiles
mise install          # just tools
```
