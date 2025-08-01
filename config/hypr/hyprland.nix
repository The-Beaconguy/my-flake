{
  lib,
  inputs,
  pkgs,
  username,
  programoptions,
  host,
  config,
  ...
}:
with lib; {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
    ];
    extraConfig = let
      modifier = "SUPER";
    in
      concatStrings [
        ''
          env = NIXOS_OZONE_WL, 1
          env = NIXPKGS_ALLOW_UNFREE, 1
          env = XDG_CURRENT_DESKTOP, Hyprland
          env = GTK_USE_PORTAL,1
          env = XDG_SESSION_TYPE, wayland
          env = XDG_SESSION_DESKTOP, Hyprland
          env = GBM_BACKEND,nvidia-drm
          env = LIBVA_DRIVER_NAME,nvidia
          env = __GLX_VENDOR_LIBRARY_NAME,nvidia
          env = GDK_BACKEND, wayland, x11
          env = CLUTTER_BACKEND, wayland
          env = QT_QPA_PLATFORM=wayland;xcb
          env = QT_WAYLAND_DISABLE_WINDOWDECORATION, 1
          env = QT_AUTO_SCREEN_SCALE_FACTOR, 1
          env = SDL_VIDEODRIVER, x11
          env = MOZ_ENABLE_WAYLAND, 1
          exec-once = dbus-update-activation-environment --systemd --all
          exec-once = systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
          exec-once = killall -q swww;sleep .5 && swww init
          exec-once = pypr
          #exec-once = killall -q waybar;sleep .5 && waybar
          #exec-once = killall -q swaync;sleep .5 && swaync
          exec-once = hyprpanel
          exec-once =  [workspace 2 silent] firefox
          exec-once = nm-applet --indicator
          exec-once = lxqt-policykit-agent
          exec-once = swww-daemon
          monitor=,preferred,auto,1

          general {
            gaps_in = 32
            gaps_out = 34
            border_size = 1
            layout = dwindle
            resize_on_border = true
            col.active_border = rgb(${config.stylix.base16Scheme.base08}) rgb(${config.stylix.base16Scheme.base0C}) 45deg
            col.inactive_border = rgb(${config.stylix.base16Scheme.base01})
          }
          input {
            kb_layout = ${programoptions.keyboardLayout}
            kb_options = grp:alt_shift_toggle,super
            follow_mouse = 1
            touchpad {
              natural_scroll = true
              disable_while_typing = true
              scroll_factor = 0.8
            }
            sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
            accel_profile = flat
          }
          #windowrule = float, nm-connection-editor|blueman-manager
          windowrulev2 = float, class:(xdg-desktop-portal-gtk)
          #windowrule = float, swayimg|vlc|Viewnior|pavucontrol
          #windowrule = float, nwg-look|qt5ct|mpv
          #windowrule = float, zoom
          windowrulev2 = stayfocused, title:^()$,class:^(steam)$
          windowrulev2 = minsize 1 1, title:^()$,class:^(steam)$
          windowrulev2 = opacity 0.9 0.7, class:^(firefox)$
          windowrulev2 = size 70% 70%, class:^(xdg-desktop-portal-gtk)$
          windowrulev2 = opacity 0.9 0.9, class:^(neovide)$
          windowrulev2 = opacity 0.9 0.7, class:^(thunar)$
          windowrulev2 = opacity 0.9 0.7, class:^(vesktop)$
          windowrulev2 = opacity 0.9 0.9, class:^(emacs)$  # works for emacs client as well
          gestures {
            workspace_swipe = true
            workspace_swipe_fingers = 3
          }
          misc {
            initial_workspace_tracking = 0
            disable_hyprland_logo = true
            mouse_move_enables_dpms = true
            key_press_enables_dpms = false
          }
          animations {
            enabled = yes
            bezier = wind, 0.05, 0.9, 0.1, 1.05
            bezier = winIn, 0.1, 1.1, 0.1, 1.1
            bezier = winOut, 0.3, -0.3, 0, 1
            bezier = liner, 1, 1, 1, 1
            animation = windows, 1, 6, wind, slide
            animation = windowsIn, 1, 6, winIn, slide top
            animation = windowsOut, 1, 5, winOut, slide
            animation = windowsMove, 1, 5, wind, slide
            animation = border, 1, 1, liner
            animation = fade, 1, 10, default
            animation = workspaces, 1, 5, wind
          }
          decoration {
            rounding = 8
            shadow {
            enabled = true
            range = 6
            render_power = 1
            color = rgba(1a1a1aee)
            color_inactive = 0x50000000
            }
            blur {
                enabled = true
                size = 5
                passes = 3
                new_optimizations = on
                ignore_opacity = off
            }
          }
            dwindle {
            pseudotile = true
            preserve_split = true
          }
          bind = ${modifier},Return,exec,${programoptions.terminal}
          bind = ${modifier}SHIFT,Return,exec,rofi-launcher
          bind = ${modifier}SHIFT,W,exec,web-search
          bind = ${modifier}ALT,W,exec,wallsetter
          bind = ${modifier}SHIFT,N,exec,swaync-client -rs
          bind = ${modifier},W,exec,${programoptions.browser}
          bind = ${modifier},E,exec,emopicker9000
          bind = ${modifier},S,exec,screenshootin
          bind = ${modifier},D,exec,${programoptions.discord-client}
          bind = ${modifier}SHIFT,E,exec,${programoptions.editor}
          bind = ${modifier},O,exec,obs
          bind = ${modifier},C,exec,hyprpicker -a
          bind = ${modifier},G,exec,gimp
          bind = ${modifier}SHIFT,G,exec,godot4
          bind = ${modifier},T,exec,${programoptions.filemanger}
          bind = ${modifier},M,exec,steam
          bind = ${modifier},Q,killactive,
          bind = ${modifier},P,pseudo,
          bind = ${modifier}SHIFT,I,togglesplit,
          bind = ${modifier},F,fullscreen,
          bind = ${modifier}SHIFT,F,togglefloating,
          bind = ${modifier}SHIFT,C,exit,
          bind = ${modifier}SHIFT,left,movewindow,l
          bind = ${modifier}SHIFT,right,movewindow,r
          bind = ${modifier}SHIFT,up,movewindow,u
          bind = ${modifier}SHIFT,down,movewindow,d
          bind = ${modifier}SHIFT,h,movewindow,l
          bind = ${modifier}SHIFT,l,movewindow,r
          bind = ${modifier}SHIFT,k,movewindow,u
          bind = ${modifier}SHIFT,j,movewindow,d
          bind = ${modifier},left,movefocus,l
          bind = ${modifier},right,movefocus,r
          bind = ${modifier},up,movefocus,u
          bind = ${modifier},down,movefocus,d
          bind = ${modifier},h,movefocus,l
          bind = ${modifier},l,movefocus,r
          bind = ${modifier},k,movefocus,u
          bind = ${modifier},j,movefocus,d
          bind = ${modifier},1,workspace,1
          bind = ${modifier},2,workspace,2
          bind = ${modifier},3,workspace,3
          bind = ${modifier},4,workspace,4
          bind = ${modifier},5,workspace,5
          bind = ${modifier},6,workspace,6
          bind = ${modifier},7,workspace,7
          bind = ${modifier},8,workspace,8
          bind = ${modifier},9,workspace,9
          bind = ${modifier},0,workspace,10
          bind = ${modifier}SHIFT,SPACE,movetoworkspace,special
          bind = ${modifier},SPACE,togglespecialworkspace
          bind = ${modifier}ALT,1,movetoworkspacesilent,1
          bind = ${modifier}ALT,2,movetoworkspacesilent,2
          bind = ${modifier}ALT,3,movetoworkspacesilent,3
          bind = ${modifier}ALT,4,movetoworkspacesilent,4
          bind = ${modifier}ALT,5,movetoworkspacesilent,5
          bind = ${modifier}ALT,6,movetoworkspacesilent,6
          bind = ${modifier}ALT,7,movetoworkspacesilent,7
          bind = ${modifier}ALT,8,movetoworkspacesilent,8
          bind = ${modifier}ALT,9,movetoworkspacesilent,9
          bind = ${modifier}SHIFT,2,movetoworkspace,2
          bind = ${modifier}SHIFT,1,movetoworkspace,1
          bind = ${modifier}SHIFT,3,movetoworkspace,3
          bind = ${modifier}SHIFT,4,movetoworkspace,4
          bind = ${modifier}SHIFT,5,movetoworkspace,5
          bind = ${modifier}SHIFT,6,movetoworkspace,6
          bind = ${modifier}SHIFT,7,movetoworkspace,7
          bind = ${modifier}SHIFT,8,movetoworkspace,8
          bind = ${modifier}SHIFT,9,movetoworkspace,9
          bind = ${modifier}SHIFT,0,movetoworkspace,10
          bind = ${modifier}CONTROL,right,workspace,e+1
          bind = ${modifier}CONTROL,left,workspace,e-1
          bind = ${modifier},mouse_down,workspace, e+1
          bind = ${modifier},mouse_up,workspace, e-1
          bindm = ${modifier},mouse:272,movewindow
          bindm = ${modifier},mouse:273,resizewindow
          bind = ALT,Tab,cyclenext
          bind = ALT,Tab,bringactivetotop
          bind = ,XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
          bind = ,XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
          binde = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
          bind = ,XF86AudioPlay, exec, playerctl play-pause
          bind = ,XF86AudioPause, exec, playerctl play-pause
          bind = ,XF86AudioNext, exec, playerctl next
          bind = ,XF86AudioPrev, exec, playerctl previous
          bind = ,XF86MonBrightnessDown,exec,brightnessctl set 5%-
          bind = ,XF86MonBrightnessUp,exec,brightnessctl set +5%
          # pypr keybinds
          bind = ${modifier},A,exec,pypr toggle term && hyprctl dispatch bringactivetotop
          bind = ${modifier},Z,exec, pypr fetch_client_menu && hyprctl dispatch bringactivetotop
          #$scratchpad = class:^(scratchpad)$
          #windowrulev2 = float,$scratchpad
          #windowrulev2 = $scratchpadsize,$scratchpad
          #windowrulev2 = workspace special silent,$scratchpad
          #windowrulev2 = center,$scratchpad
        ''
      ];
  };
}
