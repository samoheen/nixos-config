{ lib, ... }:

{
  programs.waybar = {
    enable = true;
    style = lib.mkAfter ''
      * {
        font-size: 12px;
      }
      #workspaces {
        color: #f5e0dc;
      }
      #workspaces button {
        font-weight: normal;
        color: #f5e0dc;
        padding: 0 5px;
        border-bottom: none;
        border-radius: 0px;
      }
      .modules-left #workspaces button {
        border-bottom: 1px solid transparent;
      }
      .modules-left #workspaces button.focused,
      .modules-left #workspaces button.active {
        border-bottom: 1px solid #f5e0dc;
      }
      #window {
        color: #f2cdcd;
        padding: 0 15px;
      }
      #language {
        color: #f38ba8;
      }
      #network {
        color: #eba0ac;
      }
      #backlight {
        color: #fab387;
      }
      #pulseaudio {
        color: #f9e2af;
      }
      #battery {
        color: #a6e3a1;
      }
      #clock {
        color: #94e2d5;
      }
      #custom-nixos {
        color: #74c7ec;
        padding: 0 12px 0 12px;
      }
    '';
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left =
          [ "custom/nixos" "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ ];
        modules-right = [
          "hyprland/language"
          "network"
          "backlight"
          "pulseaudio"
          "battery"
          "clock"
        ];

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

        "custom/nixos" = { format = " "; };

        "hyprland/language" = {
          format-en = "en";
          format-ru = "ru";
          tooltip = false;
        };

        "network" = {
          interface = "wlp1s0";
          format = "{ifname}";
          format-wifi = "  {signalStrength}";
          format-disconnected = "dis";
        };

        "backlight" = { format = "  {percent}"; };

        "pulseaudio" = {
          format = "  {volume}";
          format-muted = "";
        };

        "battery" = {
          format = "  {capacity}";
          format-charging = " {capacity}";
        };

        "clock" = { format = "{:%a %b %d %H:%M}"; };
      };
    };
  };
}
