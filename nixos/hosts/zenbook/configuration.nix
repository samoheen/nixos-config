{ pkgs, stateVersion, hostName, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
  
  networking = {
    hostName = hostName;
    networkmanager = {
      enable = true;
    };
  };

  time.timeZone = "Europe/Moscow";

  users.users.sam = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    initialHashedPassword = "test";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    htop
  ];

  system.stateVersion = stateVersion;
}

