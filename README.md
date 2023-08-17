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

## edit .config/home-manager/* as necessary

## home-manager does not manage system changes

those either go in `/etc/nixos/configuration.nix` or anywhere by specifying the file when rebuilding, `nixos-rebuild switch -I nixos-config=<path to file>`.
