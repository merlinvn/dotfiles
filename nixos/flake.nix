{
  description = "My Neo-Flake";

  inputs = {
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ...} @ inputs:
  let
  in {
    nixosConfigurations = {
      fusion-vm = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = { inherit inputs; };
        # Pass both stable and unstable packages to the configuration
        modules = [
          #({ config, pkgs, ... }: {
          #  # Example: using unstable package directly in the configuration
          #  #
          #  nixpkgs.overlays = [
          #    (self: super: {
          #      unstable = import nixpkgs-unstable {
          #        inherit (super) system config;
          #      };
          #    })
          #  ];

          #  environment.systemPackages = with pkgs; [
          #    # Access an unstable package as `pkgs.unstable.somePackage`
          #  ];
          #})
          ./machines/fusion-vm/configuration.nix
        ];
      };
    };
  };
}
