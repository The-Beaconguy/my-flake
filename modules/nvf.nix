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
        lineNumberMode = "relative";
        diagnostics.enable = true;

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
            lsp = {
              enable = true;
              servers = ["nixd"];
            };
          };
          python = {
            enable = true;
          };
          lua.enable = true;
          rust = {
            enable = true;
            extensions.crates-nvim.enable = true;
          };
          clang = {
            enable = true;
          };
          go = {
            enable = true;
          };
          java = {
            enable = true;
            lsp = {
              enable = true;
              servers = ["jdt-language-server"];
            };
          };
        };

        visuals = {
          nvim-scrollbar.enable = true;
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          indent-blankline.enable = true;
          cinnamon-nvim.enable = true;
          highlight-undo.enable = true;
          fidget-nvim.enable = true;
        };

        statusline = {
          lualine = {
            enable = true;
            theme = lib.mkForce "dracula";
          };
        };

        theme = {
          enable = true;
          name = lib.mkForce "rose-pine"; # Force priority is 50
          style = "moon";
          transparent = lib.mkForce true;
        };

        autopairs.nvim-autopairs.enable = true;
        autocomplete.nvim-cmp.enable = true;
        snippets.luasnip.enable = true;
        options = {
          shiftwidth = 2;
          tabstop = 2;
        };

        filetree = {
          neo-tree = {
            enable = true;
          };
        };

        tabline = {
          nvimBufferline.enable = true;
        };

        telescope.enable = true;

        git = {
          enable = true;
          gitsigns.enable = true;
        };

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
          diffview-nvim.enable = true;
          icon-picker.enable = true;
        };

        comments = {
          comment-nvim.enable = true;
        };
        notes = {
          neorg = {
            enable = true;
            treesitter.enable = true;
          };
        };
      };
    };
  };
}
