{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''
      @import "./rose-pine.css";

      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono NFM ExtraBold";
        font-size: 12px;
        min-height: 0;
      }

      window#waybar {
        background: rgba(21, 18, 27, 0);
        color: @text;
      }

      tooltip {
        background: @base;
        border-radius: 4px;
        border-width: 2px;
        border-style: solid;
        border-color: @overlay;
      }

      #workspaces button {
        box-shadow: none;
        text-shadow: none;
        padding: 0px;
        border-radius: 6px;
        margin-top: 3px;
        margin-bottom: 3px;
        margin-left: 0px;
        padding-left: 3px;
        padding-right: 3px;
        margin-right: 0px;
        color: @rose;
        animation: ws_normal 20s ease-in-out 1;
      }

      #workspaces button.active {
        background: @iris;
        color: @highlightLow;
        margin-left: 3px;
        padding-left: 8px;
        padding-right: 8px;
        margin-right: 3px;
        animation: ws_active 20s ease-in-out 1;
        transition: all 0.4s cubic-bezier(0.55, -0.68, 0.48, 1.682);
      }

      #workspaces button:hover {
        background: @rose;
        color: @love;
        animation: ws_hover 20s ease-in-out 1;
        transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
      }

      /* ... (rest of the CSS styles) ... */
    '';

    settings = {
      "layer": "top",
      "position": "top",
      "mode": "dock",
      "exclusive": true,
      "passthrough": false,
      "gtk-layer-shell": true,
      "height": 32,
      // "spacing": 4,
      "modules-left": [
        "clock",
        "custom/pad",
        "custom/notification",
        "tray",
        "hyprland/workspaces"
      ],
      "modules-center": ["hyprland/window"],
      "modules-right": [
        "memory",
        "battery",
        "custom/pad",
        "pulseaudio",
        "pulseaudio#microphone",
        "custom/pad",
        "backlight",
        "custom/pad",
        "custom/lock"
      ],
      "hyprland/window": {
        "format": "{}",
        "max-length": 65
      },
      "hyprland/workspaces": {
        "on-scroll-up": "hyprctl dispatch workspace -1",
        "on-scroll-down": "hyprctl dispatch workspace +1"
      },
      "tray": {
        "icon-size": 18,
        "spacing": 10
      },
      "clock": {
        "format": "{:%I:%M %p}",
        "rotate": 0,
        "format-alt": "{:%R 󰃭 %d·%m·%y}",
        "tooltip-format": "<span>{calendar}</span>",
        "calendar": {
          "mode": "month",
          "mode-mon-col": 3,
          "on-scroll": 1,
          "on-click-right": "mode",
          "format": {
            "months": "<span color='#ffead3'><b>{}</b></span>",
            "weekdays": "<span color='#ffcc66'><b>{}</b></span>",
            "today": "<span color='#ff6699'><b>{}</b></span>"
          }
        },
        "actions": {
          "on-click-right": "mode",
          "on-click-forward": "tz_up",
          "on-click-backward": "tz_down",
          "on-scroll-up": "shift_up",
          "on-scroll-down": "shift_down"
        }
      },
      "backlight": {
        "device": "intel_backlight",
        "format": "{icon} {percent} %",
        "format-icons": ["󰃞", "󰃟", "󰃠"],
        "on-scroll-up": "swayosd-client --brightness +1",
        "on-scroll-down": "swayosd-client --brightness -1"
      },
      "battery": {
        "states": {
          "good": 95,
          "warning": 30,
          "critical": 20
        },
        "format": "{icon} {capacity} %",
        "format-charging": " {capacity} %",
        "format-plugged": " {capacity} %",
        "format-alt": "{time} {icon}",
        "format-icons": ["󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󱈑"]
      },
      "pulseaudio": {
        "format": "{icon} {volume} %",
        "tooltip": false,
        "format-muted": "󰝟 ",
        "on-click": "GSK_RENDERER=ngl pavucontrol",
        "on-scroll-up": "swayosd-client --output-volume +1",
        "on-scroll-down": "swayosd-client --output-volume -1",
        "format-icons": {
          "headphone": "",
          "hands-free": "",
          "headset": "",
          "phone": "",
          "portable": "",
          "car": "",
          "default": ["", "", ""]
        }
      },
      "pulseaudio#microphone": {
        "class": "microphone-widget",
        "format": "{format_source}",
        "format-source": " {volume}%",
        "format-source-muted": " Muted",
        "on-click": "GSK_RENDERER=ngl pavucontrol",
        "on-scroll-up": "swayosd-client --input-volume +1",
        "on-scroll-down": "swayosd-client --input-volume -1"
      },
      "memory": {
        "states": {
          "c": 90,
          "h": 60,
          "m": 30
        },
        "interval": 30,
        "format": "󰾆 {used}GB",
        "rotate": 0,
        "format-m": "󰾅 {used}GB",
        "format-h": "󰓅 {used}GB",
        "format-c": " {used}GB",
        "format-alt": "󰾆 {percentage}%",
        "max-length": 10,
        "tooltip": true,
        "tooltip-format": "󰾆 {percentage}%\n {used:0.1f}GB/{total:0.1f}GB"
      },
      "custom/lock": {
        "format": "  ",
        "tooltip": false,
        "on-click": "wlogout -b 2"
      },
      "custom/notification": {
        "tooltip": false,
        "format": "{} {icon}",
        "format-icons": {
          "notification": "󱅫",
          "none": "",
          "dnd-notification": " ",
          "dnd-none": "󰂛",
          "inhibited-notification": " ",
          "inhibited-none": "",
          "dnd-inhibited-notification": " ",
          "dnd-inhibited-none": " "
        },
        "return-type": "json",
        "exec-if": "which swaync-client",
        "exec": "swaync-client -swb",
        "on-click": "sleep 0.1 && swaync-client -t -sw",
        "on-click-right": "sleep 0.1 && swaync-client -d -sw",
        "escape": true
      },
      "custom/pad": {
        "format": " ",
        "interval": "once",
        "tooltip": false
      }
    };
  };
}
