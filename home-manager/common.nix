{ pkgs, ...}: with pkgs; [
  anonymousPro
  any-nix-shell # use the existing shell with `nix run` and `nix-shell`
  asdf-vm
  awscli2
  aws-vault
  docker-compose
  envsubst
  eza
  fd
  fish
  fzf
  git
  gitflow
  git-lfs
  glow
  gnumake
  gnupg
  gnutar
  go
  go-task
  htop
  inetutils # for telnet
  jujutsu
  jq
  k9s
  kubernetes-helm
  lazygit
  lua-language-server
  mosh
  # libgcc # not available on macos :\
  ncurses
  nil # nix ls
  nixfmt
  nmap
  ollama-app
  postgresql_16
  qemu
  rustup
  shellcheck
  taplo # toml lsp
  tig
  tmux
  tree
  utm
  watch
  watchexec
  wget
  yq
  zlib
  zoxide
]
