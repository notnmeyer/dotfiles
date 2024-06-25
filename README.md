# dotfiles

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
  sudo sh -c 'echo "/Users/nate/.nix-profile/bin/fish" >> /etc/shells'
  chsh -s /Users/nate/.nix-profile/bin/fish
  ```

---

# with orbstack (deprecated)

## creating nixos vm with orbstack
`orbctl create nixos $NAME`

for ease of life, set it as the default vm:
`orbctl default $NAME`

## install home manager

ref:
  - https://nix-community.github.io/home-manager/index.html#sec-install-standalone
  - https://alexpearce.me/2021/07/managing-dotfiles-with-nix/ 

```shell
orb nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager && \
orb nix-channel --update && \
orb nix-shell '<home-manager>' -A install
```

## clone the repo (optional)

if you're using orbstack and your dotfiles repo live someone in your homedir, it's probably already mounted in the VM. you only really need this for VMs where you're not mounting host dirs. 

```shell
mkdir ~/code
nix-shell -p git --run "git clone https://github.com/notnmeyer/dotfiles ~/code/dotfiles"
```

## apply user changes with home-manager

from the root of the repo,

`orb home-manager switch -f /Users/nate/code/dotfiles/home-manager/home.nix`

or move the `home-manager` directory to `~/.config/` and drop the `-f` argument.

## apply system changes

- note: apply home-manager first to avoid an issue where installing fish here write a config.fish that home-manager complains about

from the root of the repo,

`orb sudo nixos-rebuild switch -I nixos-config=/Users/nate/code/dotfiles/configuration.nix`

or move `configuration/nix` to `/etc/nixos/configuration.nix` and drop the `-I` argument.
