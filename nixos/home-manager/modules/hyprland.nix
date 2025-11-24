{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      monitor = ",preferred,auto,auto";

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
      };

      "$mod" = "SUPER";
 
      bind = [
        "$mod, RETURN, exec, alacritty"
      ];
    };
  };

  services.dunst.enable = true;
  programs.alacritty.enable = true;
}
