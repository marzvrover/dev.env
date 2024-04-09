{
  description = "The Ruling Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
      editions = rec {
        worldbringer = {
          system = "x86_64-linux";
          modules = [
            ./editions/worldbringer.nix
            ./hosts/mac-mini-2012-wb.nix
          ];
          hostname = "worldbringer";
        };
        worldbringer-dev = {
          system = editions.worldbringer.system;
          modules = editions.worldbringer.modules ++ [
            ./components/nix-dev.nix
          ];
          hostname = "${editions.worldbringer.hostname}-dev";
        };
      };
  in {
    nixosConfigurations = {
      worldbringer = lib.nixosSystem {
        system = editions.worldbringer.system;
        modules = editions.worldbringer.modules;
      };
      worldbringer-dev = lib.nixosSystem {
        system = editions.worldbringer-dev.system;
        modules = editions.worldbringer-dev.modules;
      };
    };
  };
}
