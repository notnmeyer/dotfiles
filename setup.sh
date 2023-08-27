#!/usr/bin/env bash
set -eu

NAME=${NAME:-nixos}
ORB_CMD="orb -m $NAME"
SET_DEFAULT="${SET_DEFAULT:-true}"

# create vm
orbctl create nixos "$NAME"
[ "$SET_DEFAULT" == "true" ] && orbctl default "$NAME"

# switch to unstable, this needs root
$ORB_CMD sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
$ORB_CMD sudo nixos-rebuild switch --upgrade

# install home-manager. the version maps to the nix release being used.

# unstable,
$ORB_CMD nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

# 23.05,
# $ORB_CMD nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager

$ORB_CMD nix-channel --update
$ORB_CMD nix-shell '<home-manager>' -A install

# run home-manager
DOTFILES_DIR=/Users/nate/code/dotfiles
$ORB_CMD home-manager switch -f "${DOTFILES_DIR}/home-manager/home.nix"

# run nixos-rebuild
$ORB_CMD sudo nixos-rebuild switch -I nixos-config="${DOTFILES_DIR}/configuration.nix"

echo "Done!"
