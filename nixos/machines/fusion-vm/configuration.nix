# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ../../modules/state-version.nix
      ./hardware-configuration.nix
      ../../modules/base.nix
      ../../modules/common-packages.nix
      ../../modules/development-tools.nix
      ../../modules/hyprland.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nix-m3"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.neo = {
  #   isNormalUser = true;
  #   description = "Neo";
  #   extraGroups = [ "networkmanager" "wheel" ];
  #   packages = with pkgs; [];
  #   shell = pkgs.zsh;
  # };

  # the specific packages to use with this machine
  environment.systemPackages = with pkgs; [
  ];

  virtualisation.vmware.guest.enable = true;
}
