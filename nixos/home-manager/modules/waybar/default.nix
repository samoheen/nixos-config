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
        modules-right = [ "hyprland/language" "battery"  "clock" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          show-special = true;
          special-visible-only = true;
          all-outputs = false;
          format = "{icon}";
          format-icons = {
            "1" = "Ⅰ";
            "2" = "Ⅱ";
            "3" = "Ⅲ";
            "4" = "Ⅳ";
            "5" = "Ⅴ";
            "6" = "Ⅵ";
            "7" = "Ⅶ";
            "8" = "Ⅷ";
            "9" = "Ⅸ";
            "magic" = "Ⅹ";
          };
        };

        "hyprland/language" = {
          format-en = "[en]";
          format-ru = "[ru]";
          tooltip = false;
        };

        "battery" = {
          format = "[{capacity}%]";
          format-charging = "[⚡{capacity%}]"
        };

        "clock" = {
          format = "[{:%d.%m.%Y] [%H:%M}]";
        };
      };
    };
  };
}
