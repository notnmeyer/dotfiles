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

`mise bootstrap` installs tools, links dotfiles, applies macos defaults, installs casks, and makes fish the login shell.

then make the profile stick (from fish):

## apply changes

```shell
mise bootstrap        # everything
mise dotfiles apply   # just relink dotfiles
mise install          # just tools
```
