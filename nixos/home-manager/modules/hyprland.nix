{ user, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      monitor = ",preferred,auto,auto";

      exec-once = [
        "waybar"
      ];

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
        "SUPER_SHIFT, Q, killactive,"

        "SUPER_SHIFT, A, exec, alacritty"
        "SUPER_SHIFT, Z, exec, zen"
        "SUPER_SHIFT, X, exec, alacritty -e sh -c 'ranger ~'"
        "SUPER_SHIFT, S, exec, aseprite"

        ",            PRINT, exec, grimblast --notify --freeze copysave area"

        "SUPER,       LEFT, movefocus, l"
        "SUPER,       RIGHT, movefocus, r"
        "SUPER,       UP, movefocus, u"
        "SUPER,       DOWN, movefocus, d"

        "SUPER,       1, workspace, 1"
        "SUPER,       2, workspace, 2"
        "SUPER,       3, workspace, 3"
        "SUPER,       4, workspace, 4"
        "SUPER,       5, workspace, 5"
        "SUPER,       6, workspace, 6"
        "SUPER,       7, workspace, 7"
        "SUPER,       8, workspace, 8"
        "SUPER,       9, workspace, 9"
        "SUPER,       0, workspace, 10"

        "SUPER_SHIFT, 1, movetoworkspacesilent, 1"
        "SUPER_SHIFT, 2, movetoworkspacesilent, 2"
        "SUPER_SHIFT, 3, movetoworkspacesilent, 3"
        "SUPER_SHIFT, 4, movetoworkspacesilent, 4"
        "SUPER_SHIFT, 5, movetoworkspacesilent, 5"
        "SUPER_SHIFT, 6, movetoworkspacesilent, 6"
        "SUPER_SHIFT, 7, movetoworkspacesilent, 7"
        "SUPER_SHIFT, 8, movetoworkspacesilent, 8"
        "SUPER_SHIFT, 9, movetoworkspacesilent, 9"
        "SUPER_SHIFT, 0, movetoworkspacesilent, 10"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute,        exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute,     exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];
    };
  };
  
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "/home/${user}/.config/wallpapers/2.png"
      ];
      wallpaper = [
        ",/home/${user}/.config/wallpapers/2.png"
      ];
    };
  };
  
  services.dunst.enable = true;
}
