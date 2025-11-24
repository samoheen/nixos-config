{ pkgs, stateVersion, hostName, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    htop
  ];

  system.stateVersion = stateVersion;
}

