{
  description = "flake home-manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";
      username = "nate";
    in {
      homeConfigurations = {
        "${username}-home" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          modules = [ ./home-manager/home.nix ];
          extraSpecialArgs = { inherit username; };
        };

        "${username}-work" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { inherit system; };
          modules = [ ./home-manager/work.nix ];
          extraSpecialArgs = { inherit username; };
        };
      };
    };
}
