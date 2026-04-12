{
  programs.fastfetch = {
    enable = true;

    settings = {
      display = {
        color = {
          keys = "35";
          output = "90";
        };
      };

      logo = {
        #source = ./nixos.png;
        type = "kitty-direct";
        height = 15;
        width = 30;
        padding = {
          top = 3;
          left = 3;
        };
      };

      modules = [
        "break"
        {
          type = "custom";
          format = "┌──────────────────────Hardware──────────────────────┐";
        }
        {
          type = "cpu";
          key = "│  ";
          keyColor = "31";
        }
        {
          type = "gpu";
          key = "│ 󰍛 ";
          keyColor = "31";
        }
        {
          type = "memory";
          key = "│ 󰑭 ";
          keyColor = "31";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "┌──────────────────────Software──────────────────────┐";
        }
        {
          type = "custom";
          format = " OS -> Nixos";
          keyColor = "31";
        }
        {
          type = "kernel";
          key = "│ ├ ";
          keyColor = "31";
        }
        {
          type = "packages";
          key = "│ ├󰏖 ";
          keyColor = "31";
        }
        {
          type = "shell";
          key = "└ └ ";
          keyColor = "31";
        }
        "break"
        {
          type = "wm";
          key = " WM";
          keyColor = "32";
        }
        {
          type = "wmtheme";
          key = "│ ├󰉼 ";
          keyColor = "32";
        }
        {
          type = "terminal";
          key = "└ └ ";
          keyColor = "32";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "┌────────────────────Uptime / Age────────────────────┐";
        }
        {
          type = "command";
          key = "│  ";
          keyColor = "33";
          text =
            #bash
            ''
              birth_install=$(stat -c %W /)
              current=$(date +%s)
              delta=$((current - birth_install))
              delta_days=$((delta / 86400))
              echo $delta_days days
            '';
        }
        {
          type = "uptime";
          key = "│  ";
          keyColor = "33";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
      ];
    };
  };
}
