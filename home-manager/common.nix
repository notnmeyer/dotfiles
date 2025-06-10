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
  jq
  kubernetes-helm
  lazygit
  lua-language-server
  mosh
  # libgcc # not available on macos :\
  nil # nix ls
  nixfmt
  nodejs_22
  nodePackages.bash-language-server
  nodePackages.typescript-language-server
  nodePackages.prettier
  postgresql_16
  qemu
  rustup
  shellcheck
  taplo # toml lsp
  tig
  tmux
  tree
  watch
  watchexec
  wget
  yaml-language-server
  yq
  zoxide
]
