{lib, ...}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        presence.neocord = {
          enable = true;
          setupOpts = {
            logo = "https://raw.githubusercontent.com/IogaMaster/neovim/refs/heads/main/.github/assets/nixvim-dark.webp";
          };
        };
        viAlias = false;
        vimAlias = true;

        lsp = {
          enable = true;
          formatOnSave = true;
          lightbulb.enable = true;
          trouble.enable = true;
        };

        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix = {
            enable = true;
            lsp.enable = true;
          };
          python = {
            enable = true;
            dap.enable = true;
            format.enable = true;
            lsp.enable = true;
            lsp.server = "pyright";
          };
          lua.enable = true;
          rust.enable = true;
          clang = {
            enable = true;
            lsp.enable = true;
          };
        };

        visuals = {
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          indent-blankline.enable = true;
        };

        # Status line
        statusline = {
          lualine = {
            enable = true;
            theme = lib.mkForce "dracula";
          };
        };

        # Theme
        theme = {
          enable = true;
          name = lib.mkForce "rose-pine"; # Force priority is 50
          style = "main";
          transparent = lib.mkForce true;
        };

        # Essential features
        autopairs.nvim-autopairs.enable = true;
        autocomplete.nvim-cmp.enable = true;
        snippets.luasnip.enable = true;
        options = {
          shiftwidth = 2;
          tabstop = 2;
        };

        # File tree
        filetree = {
          neo-tree = {
            enable = true;
          };
        };

        # Tab line
        tabline = {
          nvimBufferline.enable = true;
        };

        # Navigation and search
        telescope.enable = true;

        # Git integration
        git = {
          enable = true;
          gitsigns.enable = true;
        };

        # Terminal
        terminal = {
          toggleterm = {
            enable = true;
          };
        };

        ui = {
          borders.enable = true;
          colorizer.enable = true;
          illuminate.enable = true;
          noice.enable = true;
          fastaction.enable = true;
        };
        utility = {
          yanky-nvim.enable = false;
          icon-picker.enable = true;
        };

        comments = {
          comment-nvim.enable = true;
        };
      };
    };
  };
}
