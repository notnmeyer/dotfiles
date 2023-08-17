#!/usr/bin/env bash
set -eu

# create vm
orbctl create nixos
orbctl default nixos

# install home-manager
orb nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
orb nix-channel --update
orb nix-shell '<home-manager>' -A install

# run home-manager
DOTFILES_DIR=/Users/nate/code/dotfiles
orb home-manager switch -f "${DOTFILES_DIR}/home-manager/home.nix"

# run nixos-rebuild
orb sudo nixos-rebuild switch -I nixos-config="${DOTFILES_DIR}/configuration.nix"
