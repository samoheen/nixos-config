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
        };

        "hyprland/language" = {
          format-en = "[en]";
          format-ru = "[ru]";
          tooltip = false;
        };

        "battery" = {
          format = "[{capacity}]";
        };

        "clock" = {
          format = "[{:%d.%m.%Y - %H:%M}]";
        };
      };
    };
  };
}
