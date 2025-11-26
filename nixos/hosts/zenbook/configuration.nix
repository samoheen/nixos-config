{ pkgs, stateVersion, hostName, user, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "Hyprland";
        user = "${user}";
      };
      default_session = {
        command = "{${pkgs.greetd.tuigreet}/bin/tuigreet} --greeting 'Welcome to NixOS' --asterisks --remember --remember-user-session --time -cmd Hyprland ";
        user = "greeter";
      };
    };
  };

  programs.hyprland = {
    enable = true;
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
    zsh

    waybar
    rofi-wayland
    dunst
    kitty
 
    grim
    slurp
    wl-clipboard

    unstable.rustup
    unstable.go
  ];

  system.stateVersion = stateVersion;
}

