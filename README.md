# dotfiles

## creating nixos vm with orbstack
`orbctl create nixos $NAME`

for ease of life, set it as the default vm:
`orbctl default $NAME`

## install home manager

ref:
  - https://nix-community.github.io/home-manager/index.html#sec-install-standalone
  - https://alexpearce.me/2021/07/managing-dotfiles-with-nix/ 

```shell
orb \
  nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager && \
  nix-channel --update
orb nix-shell '<home-manager>' -A install
```

## clone the repo

```shell
mkdir ~/code
nix-shell -p git --run "git clone https://github.com/notnmeyer/dotfiles ~/code/dotfiles"
```

## apply user changes

from the root of the repo,

`home-manager switch -I ./home-manager/home.nix`

or move the `home-manager` directory to `~/.config/` and drop the `-I` argument.

## apply system changes

from the root of the repo,

`sudo nixos-rebuild switch _ ./configuration.nix`

or move `configuration/nix` to `/etc/nixos/configuration.nix` and drop the `-I` argument.
