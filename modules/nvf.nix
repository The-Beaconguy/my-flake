{...}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;

        lsp = {
          enable = true;
          formatOnSave = true;
          lightbulb.enable = true;
          trouble.enable = true;
        };

        languages = {
          enableLSP = true;
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix.enable = true;
          lua.enable = true;
          rust.enable = true;
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
            theme = "gruvbox";
          };
        };

        # Theme
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
          transparent = true;
        };

        # Essential features
        autopairs.nvim-autopairs.enable = true;
        autocomplete.nvim-cmp.enable = true;
        snippets.luasnip.enable = true;

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
        };

        comments = {
          comment-nvim.enable = true;
        };
      };
    };
  };
}
