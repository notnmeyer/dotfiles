{
  description = "flake home-manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      username = "nate";
      macos = "aarch64-darwin";
      linux = "x86_64-linux";
    in {
      homeConfigurations = {
        "home:${macos}" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = macos; };
          modules = [ ./home-manager/home.nix ];
          extraSpecialArgs = { inherit username; };
        };

        "home:${linux}" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = linux; };
          modules = [ ./home-manager/home.nix ];
          extraSpecialArgs = { inherit username; };
        };

        "work:${macos}" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = macos; };
          modules = [ ./home-manager/work.nix ];
          extraSpecialArgs = { inherit username; };
        };
      };
    };
}
