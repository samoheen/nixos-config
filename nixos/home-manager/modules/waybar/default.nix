{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "hyprland/language" "pulseaudio" "battery" "clock" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          show-special = true;
          special-visible-only = true;
          all-outputs = false;
          format = "{id}";
          format-icons = {
            "1" = "I";
            "2" = "II";
            "3" = "III";
            "4" = "IV";
            "5" = "V";
            "6" = "VI";
            "7" = "VII";
            "8" = "VIII";
            "9" = "IX";
            "magic" = "X";
          };
        };

        "hyprland/language" = {
          format-en = "en";
          format-ru = "ru";
          tooltip = false;
        };
        
        "pulseaudio" = {
          format = "{volume}.s";
          format-muted = "mut.s";
        };

        "battery" = {
          format = "{capacity}.b";
          format-charging = "{capacity}!.b";
        };

        "clock" = {
          format = "{:%a %b %d %H:%M}";
        };
      };
    };
  };
}
