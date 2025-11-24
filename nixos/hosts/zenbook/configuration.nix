{ pkgs, stateVersion, hostName, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  security.polkit.enable = true;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    htop

    waybar
    rofi-wayland
    dunst
    kitty
 
    grim
    slurp
    wl-clipboard
  ];

  system.stateVersion = stateVersion;
}

