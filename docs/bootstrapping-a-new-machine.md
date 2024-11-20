# bootstrapping a new machine

this is the minimum necessary junk to get to the point where we can get nix installed and running

## install homebrew

homebrew is used for installing casks

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

### source the bits so homebrew works

don't bother putting this into .zsh

`eval $(/opt/homebrew/bin/brew shellenv)`

## install 1pw

`brew install --cask 1password`

log into 1pw

## copy ssh key from a known good machine

`scp -r "wormulon:~/.ssh/id_ed25519*" ~/`

## clone dotfiles
```
mkdir ~/code && cd ~/code
git clone git@github.com:notnmeyer/dotfiles.git
```

## install brewfile
`brew bundle --file=home/brew/Brewfile`

great, now we have wezterm and can see colors properly. switch to wezterm.

# hey congrats, you did it

head over to the readme and start the nix stuff
