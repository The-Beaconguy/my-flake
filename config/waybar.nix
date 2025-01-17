{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        modules-center = ["custom/pad" "hyprland/workspaces"];
        modules-left = ["hyprland/window"];
        modules-right = ["tray" "cpu" "memory" "custom/exit" "idle_inhibitor" "clock" "pulseaudio" "custom/pad"];

        "hyprland/window" = {
          format = "{title}";
          max-length = 333;
          seperate-outputs = true;
          rewrite = {
            "" = " 🙈 yo No Windows? ";
          };
        };
        "custom/pad" = {
          format = "  ";
          tooltip = false;
        };
        "custom/exit" = {
          tooltip = false;
          format = "";
          on-click = "sleep 0.1 && wlogout";
        };

        clock = {
          format = '' {:L%H:%M}'';
          "tooltip-format" = "{calendar}";
          calendar = {
            mode = "month";
            "mode-mon-col" = 3;
            "on-scroll" = 1;
            "on-click-right" = "mode";
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>{%W}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b>{}</b></span>";
            };
          };
          actions = {
            "on-click-middle" = "mode";
            "on-click-right" = "shift_up";
            "on-click" = "shift_down";
          };
        };

        cpu = {
          format = "<span foreground='#b8bb26'>󰯳</span> {usage}%";
        };

        memory = {
          format = "<span foreground='#d65d9e'>󰍛</span> {}%";
          interval = 1;
        };

        "hyprland/workspaces" = {
          format = "{icon}";
          "active-only" = false;
          "sort-by-number" = true;
          "on-click" = "activate";
          "all-outputs" = false;
          "format-icons" = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "٤";
            "5" = "٥";
            "6" = "٦";
            "7" = "٧";
            "8" = "٨";
            "9" = "٩";
            "10" = "一٠";
          };
        };

        pulseaudio = {
          format = "<span foreground='#cc241d'>{icon}</span> {volume}%  {format_source}";
          "format-bluetooth" = "<span foreground='#b16286'>{icon}</span> {volume}%  {format_source}";
          "format-bluetooth-muted" = "<span foreground='#D699B6'>󰖁</span>  {format_source}";
          "format-muted" = "<span foreground='#7A8478'>󰖁</span>  {format_source}";
          "format-source" = "<span foreground='#E67E80'></span> {volume}%";
          "format-source-muted" = "<span foreground='#F38BA8'></span>";
          "format-icons" = {
            headphone = "";
            phone = "";
            portable = "";
            default = ["" "" ""];
          };
          on-click = "sleep 0.1 && pavucontrol";
          input = true;
        };

        tray = {
          format = "<span foreground='#D3C6AA'>{icon}</span>";
          "icon-size" = 14;
          spacing = 5;
        };

        "idle_inhibitor" = {
          format = "{icon}";
          "format-icons" = {
            activated = "󱠛";
            deactivated = "󱤱";
          };
        };
      };
    };

    style = ''
      @define-color bg-hover #272E32;
      @define-color lbg #3c3836;
      @define-color bg #282828;
      @define-color blue #83a598;
      @define-color sky #458588;
      @define-color red #fb4934;
      @define-color pink #cc241d;
      @define-color lavender #d3869b;
      @define-color rosewater #b16286;
      @define-color flamingo #b16286;
      @define-color fg #fbf1c7;
      @define-color green #8ec08c;
      @define-color active-green #689d6a;
      @define-color dark-fg #a89984;
      @define-color peach #f2966b;
      @define-color border @lavender;
      @define-color gray2 #928374;
      @define-color black4 #1d2021;
      @define-color black3 #32302f;
      @define-color maroon #cc241d;
      @define-color yellow #d79921;

      * {
        min-height: 0;
        margin: 0;
        padding: 0;
        border-radius: 7px;
        font-family: "JetBrains Mono Nerd Font";
        font-size: 10pt;
        font-weight: 700;
        padding-bottom: 0px;
      }

      tooltip {
        background: @bg;
        border-radius: 7px;
        border: 2px solid @border;
      }

      #window {
        margin: 5px 5px 2px 5px;
        padding-left: 10px;
        padding-right: 7px;
        border-radius: 3px;
        border-bottom: 2px solid @bg;
        border-right: 2px solid @bg;
        border-color: @lbg;
        background-color: @yellow;
        color: @bg;
      }

      window#waybar.empty #window {
        background-color: @yellow;
        color: @bg;
        border-bottom: none;
        border-right: none;
      }

      window#waybar {
        background-color: transparent;
        color: @lavender;
      }

      #workspaces {
        margin: 5px 5px 2px 5px;
        border-radius: 8px;
        padding-left: 5px;
        padding-right: 5px;
        background-color: @bg;
        color: @bg;
      }

      #workspaces button {
        margin-top: 3px;
        margin-bottom: 3px;
        min-height: 27px;
        min-width: 27px;
        font-size: 27px;
        margin-left: 0px;
        margin-right: 0px;
        border-radius: 3px;
        padding-left: 3px;
        padding: 0px;
        padding-right: 3px;
        background-color: @bg;
        color: @fg;
      }

      #workspaces button.active {
        margin-right: 3px;
        min-width: 27px;
        min-height: 27px;
        font-size: 27px;
        margin-left: 3px;
        padding-right: 8px;
        padding-left: 8px;
        background-color: @blue;
        color: @bg;
      }

      #workspaces button.urgent {
        color: #F38BA8;
      }

      #workspaces button:hover {
        border: solid transparent;
      }

      #tray {
        margin: 5px 5px 2px 5px;
        border-radius: 3px;
        padding-left: 10px;
        padding-right: 10px;
        background-color: @bg;
        color: @fg;
      }
      #custom-exit,
      #idle_inhibitor {
        margin: 5px 5px 2px 5px;
        padding-left: 10px;
        padding-right: 12px;
        border-radius: 3px;
        background-color: @bg;
        color: @fg;
      }

      #cpu,
      #memory {
        margin: 5px 5px 2px 5px;
        padding-left: 10px;
        padding-right: 10px;
        border-radius: 3px;
        color: @fg;
        background-color: @bg;
      }

      #pulseaudio {
        margin-top: 5px;
        margin-bottom: 2px;
        color: @fg;
        background-color: @bg;
        border-top-right-radius: 0px;
        border-bottom-right-radius: 0px;
        border-top-left-radius: 3px;
        border-bottom-left-radius: 3px;
        margin-right: 0px;
        margin-left: 5px;
        padding-left: 10px;
        padding-right: 7.5px;
      }

      #clock {
        margin: 5px 5px 2px 5px;
        padding-left: 10px;
        padding-right: 10px;
        border-radius: 3px;
        color: @bg;
        background-color: @lavender;
      }
    '';
  };
}
