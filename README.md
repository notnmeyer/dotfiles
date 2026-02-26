# dotfiles

## new machine or setting up from scratch?
check out the [initial bootstrap](./docs/bootstrapping-a-new-machine.md) stuff first.

## install nix
via multi-user installation from: https://nixos.org/download
```shell
sh <(curl -L https://nixos.org/nix/install)
```

## install home-manager
``` shell
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager && \
nix-channel --update && \
nix-shell '<home-manager>' -A install
```

## apply updates
``` shell
home-manager switch -f ~/code/dotfiles/home-manager/(home|work).nix
```

## notes

- after a fresh installation, set up fish:
  ``` shell
  sudo sh -c 'echo $(which fish) >> /etc/shells'
  chsh -s $(which fish)
  ```
