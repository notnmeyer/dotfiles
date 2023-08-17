#!/usr/bin/env bash
set -eu

NAME=${NAME:-nixos}
ORB_CMD="orb -m $NAME"

# create vm
orbctl create nixos "$NAME"
orbctl default "$NAME"

# install home-manager
$ORB_CMD nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
$ORB_CMD nix-channel --update
$ORB_CMD nix-shell '<home-manager>' -A install

# run home-manager
DOTFILES_DIR=/Users/nate/code/dotfiles
$ORB_CMD home-manager switch -f "${DOTFILES_DIR}/home-manager/home.nix"

# run nixos-rebuild
$ORB_CMD sudo nixos-rebuild switch -I nixos-config="${DOTFILES_DIR}/configuration.nix"
