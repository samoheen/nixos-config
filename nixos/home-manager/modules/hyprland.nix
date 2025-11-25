{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      monitor = ",preferred,auto,auto";

      exec-once = {
        "waybar"
      };

      general = {
        gaps_in = 0;
        gaps_out = 0;
      };

      animations = {
        enabled = false;
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
      };

      bind = [
        "SUPER, Q, killactive,"
        "SUPER, RETURN, exec, alacritty"
        "SUPER_SHIFT, Z, exec, zen"
      ];
    };
  };

  services.dunst.enable = true;
  programs.alacritty.enable = true;
}
