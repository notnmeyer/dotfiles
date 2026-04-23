{ pkgs, ...}: with pkgs; [
  amazon-ecr-credential-helper
  anonymousPro
  any-nix-shell # use the existing shell with `nix run` and `nix-shell`
  awscli2
  aws-vault
  bun
  colima
  container-structure-test
  docker-client
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
  kubectl
  kubernetes-helm
  lazygit
  lazyjj
  lua-language-server
  mosh
  ncurses
  nil # nix ls
  nixfmt
  nmap
  nushell
  ollama
  postgresql_16
  qemu
  shellcheck
  taplo # toml lsp
  tig
  tmux
  tree
  watch
  watchexec
  wget
  xz # lzma replacement
  yq
  zlib
  zoxide
]
