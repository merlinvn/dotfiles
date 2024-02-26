{
  description = "My Neo-Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ...} @ inputs:
  let
  in {
    nixosConfigurations = {
      nix-air = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./machines/mba15/configuration.nix
        ];
      };
      fusion-vm = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./machines/fusion-vm/configuration.nix
        ];
      };
    };
  };
}
