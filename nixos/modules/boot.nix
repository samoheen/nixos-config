{ pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.catTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
}

