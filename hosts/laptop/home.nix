{
  pkgs,
  username,
  lib,
  host,
  programoptions,
  ...
}: {
  # Home Manager Settings
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
  };

  # Import Program Configurations
  imports = [
    ../../config/emoji.nix
    #../../config/firefox/firefox.nix
    ../../config/emacs/emacs.nix
    ../../config/shells/sh.nix
    #../../config/fastfetch
    #../../config/sway/sway.nix
    ../../config/hypr/hyprland.nix
    ../../config/hypr/pyprland.nix
    ../../config/hypr/hyprpanel.nix
    #../../config/river/river.nix
    ../../config/neovim.nix
    #../../config/vesktop.nix
    ../../config/rofi/rofi.nix
    ../../config/rofi/config-emoji.nix
    ../../config/rofi/config-long.nix
    #../../config/yazi/yazi.nix
    ../../config/swaync.nix
    ../../config/waybar.nix
    ../../config/wlogout.nix
  ];

  # Place Files Inside Home Directory
  home.file."Pictures/Wallpapers" = {
    source = ../../config/wallpapers;
    recursive = true;
  };
  home.file.".config/wlogout/icons" = {
    source = ../../config/wlogout;
    recursive = true;
  };
  home.file.".face.icon".source = ../../config/face.jpg;
  home.file.".config/face.jpg".source = ../../config/face.jpg;
  home.file.".config/swappy/config".text = ''
    [Default]
    save_dir=/home/${username}/Pictures/Screenshots
    save_filename_format=swappy-%Y%m%d-%H%M%S.png
    show_panel=false
    line_size=5
    text_size=20
    text_font=Ubuntu
    paint_mode=brush
    early_exit=true
    fill_shape=false
  '';

  # Install & Configure Git
  programs.git = {
    enable = true;
    userName = "mohammedgit";
    userEmail = "mohammedgit@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # Create XDG Dirs
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  # Styling Options
  stylix = {
    targets = {
      firefox.enable = false;
      waybar.enable = false;
      vesktop.enable = false;
      rofi.enable = false;
      hyprland.enable = false;
    };
  };
  gtk = {
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
  qt = {
    enable = true;
    style.name = lib.mkDefault "adwaita-dark";
    platformTheme.name = lib.mkDefault "gtk3";
  };

  # Scripts
  home.packages = [
    (import ../../scripts/emopicker9000.nix {inherit pkgs;})
    (import ../../scripts/task-waybar.nix {inherit pkgs;})
    (import ../../scripts/squirtle.nix {inherit pkgs;})
    (import ../../scripts/nvidia-offload.nix {inherit pkgs;})
    (import ../../scripts/wallsetter.nix {
      inherit pkgs;
      inherit username;
    })
    (import ../../scripts/web-search.nix {inherit pkgs;})
    (import ../../scripts/rofi-launcher.nix {inherit pkgs;})
    (import ../../scripts/screenshootin.nix {inherit pkgs;})
    (import ../../scripts/list-hypr-bindings.nix {
      inherit pkgs;
      inherit host;
      inherit programoptions;
    })
  ];

  services = {
    hypridle = {
      settings = {
        general = {
          after_sleep_cmd = "hyprctl dispatch dpms on";
          ignore_dbus_inhibit = false;
          lock_cmd = "hyprlock";
        };
        listener = [
          {
            timeout = 900;
            on-timeout = "hyprlock";
          }
          {
            timeout = 1200;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };

  programs = {
    gh.enable = true;
    btop = {
      enable = true;
      settings = {
        vim_keys = true;
      };
    };
    kitty = {
      enable = true;
      package = pkgs.kitty;
      settings = {
        scrollback_lines = 2000;
        wheel_scroll_min_lines = 1;
        window_padding_width = 4;
        confirm_os_window_close = 0;
      };
      extraConfig = ''
        tab_bar_style fade
        tab_fade 1
        active_tab_font_style   bold
        inactive_tab_font_style bold
      '';
    };
    starship = {
      enable = true;
      package = pkgs.starship;
    };
    home-manager.enable = true;
    hyprlock = {
      enable = false;
      #settings = {
      #general = {
      #disable_loading_bar = true;
      #grace = 10;
      #hide_cursor = true;
      #no_fade_in = false;
      #};
      #lib.mkprio.background = [
      #{
      #path = "/home/${username}/Pictures/Wallpapers/nix-gruv.jpg";
      #blur_passes = 3;
      #blur_size = 8;
      #}
      #];
      #image = [
      #{
      #path = "/home/${username}/.config/face.jpg";
      #size = 150;
      #border_size = 4;
      #border_color = "rgb(0C96F9)";
      #rounding = -1; # Negative means circle
      #position = "0, 200";
      #halign = "center";
      #valign = "center";
      #}
      #];
      #lib.mkprio.input-field = [
      #{
      #size = "200, 50";
      #position = "0, -80";
      #monitor = "";
      #dots_center = true;
      #fade_on_empty = false;
      #font_color = "rgb(CFE6F4)";
      #inner_color = "rgb(657DC2)";
      #outer_color = "rgb(0D0E15)";
      #outline_thickness = 5;
      #placeholder_text = "Password...";
      #shadow_passes = 2;
      #}
      #];
      #};
    };
  };
}
