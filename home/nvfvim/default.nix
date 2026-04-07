{
  inputs,
  pkgs,
  conf,
  ...
}:

{

  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;

        lsp = {
          enable = true;
          formatOnSave = true;
          lightbulb.enable = true;
          lspsaga.enable = true;
        };

        autocomplete.nvim-cmp = {
          enable = true;
          mappings = {
            confirm = "<CR>"; # Enter para aceptar sugerencia
            complete = "<C-Space>"; # Ctrl+Espacio abrir el menu
            next = "<Tab>"; # Tabulador para bajar en la lista
            previous = "<S-Tab>"; # Shift+Tabulador para subir
          };
        };

        snippets.luasnip.enable = true;

        formatter.conform-nvim = {
          enable = true;
          setupOpts = {
            format_on_save = {
              lsp_fallback = true;
              timeout_ms = 500;
            };
            formatters_by_ft = {
              javascript = [ "prettier" ];
              typescript = [ "prettier" ];
              css = [ "prettier" ];
              html = [ "prettier" ];
              json = [ "prettier" ];
            };
          };
        };

        options = {
          # general settings
          clipboard = "unnamedplus";
          mouse = "a";
          splitbelow = true;
          splitright = true;
          timeoutlen = 500;
          termguicolors = true;
          completeopt = "menuone,noselect";
          updatetime = 300;

          # tab settings
          tabstop = 2;
          shiftwidth = 2;
          softtabstop = 2;
          expandtab = true;
          shiftround = true;
          autoindent = true;
          smartindent = true;

          # line numbers
          number = true;
          relativenumber = true;
          wrap = false;
          cursorline = true;
          signcolumn = "yes";
          scrolloff = 8;
          sidescrolloff = 5;

          # search
          ignorecase = true;
          smartcase = true;
          incsearch = true;
          hlsearch = true;

          # swap
          swapfile = false;
          backup = false;
          writebackup = false;
          undofile = true;

          # text stuff
          list = true;
          listchars = "tab:→\\ ,trail:°,extends:›,precedes:‹";

          # fold your laundry
          foldmethod = "indent";
          foldlevel = 99;
          foldenable = false;
        };

        keymaps = [
          {
            mode = "n";
            key = "<leader>w";
            action = ":w<CR>";
            silent = false;
          }
          {
            mode = "n";
            key = "<leader>q";
            action = ":q<CR>";
            silent = false;
          }
          {
            mode = "n";
            key = "<leader>ff";
            action = "<cmd>Telescope find_files<CR>";
          }
          {
            mode = "n";
            key = "<leader>fg";
            action = "<cmd>Telescope live_grep<CR>";
          }
          {
            mode = "n";
            key = "<leader>fb";
            action = "<cmd>Telescope buffers<CR>";
          }
          {
            mode = "n";
            key = "<leader>fh";
            action = "<cmd>Telescope help_tags<CR>";
          }
          {
            mode = "n";
            key = "<leader>lp";
            action = "<cmd>lua require('gitsigns').preview_hunk()<CR>";
          }
          {
            mode = "n";
            key = "<leader>cf"; # Espacio + CF -> Formatear codigo
            action = "<cmd>lua vim.lsp.buf.format()<CR>";
            silent = true;
          }

          # NvimTree
          {
            mode = "n";
            key = "<C-n>"; # Ctrl + n
            action = "<cmd>NvimTreeToggle<CR>";
            silent = true;
          }
          {
            mode = "n";
            key = "<leader>e"; # Espacio + e (Alternativa)
            action = "<cmd>NvimTreeToggle<CR>";
            silent = true;
          }
          # Bufferline
          {
            mode = "n";
            key = "<Tab>"; # Tab -> Pestaña siguiente
            action = "<cmd>BufferLineCycleNext<CR>";
            silent = true;
          }
          {
            mode = "n";
            key = "<S-Tab>"; # Shift + Tab -> Pestaña anterior
            action = "<cmd>BufferLineCyclePrev<CR>";
            silent = true;
          }
          {
            mode = "n";
            key = "<leader>x"; # Espacoi + X -> Cerrar pestaña
            action = "<cmd>bdelete<CR>";
            silent = true;
          }
        ];

        # Language support
        languages = {
          nix.enable = true;

          ts.enable = true;
          html.enable = true;
          css.enable = true;
          json.enable = true;
          tailwind.enable = true;

          python.enable = true;
          clang.enable = true;
        };

        visuals = {
          indent-blankline = {
            enable = true;
            setupOpts = {
              indent = {
                char = "▏";
                tab_char = "▏";
              };
              scope = {
                enabled = true;
                show_start = true;
                show_end = false;
              };
            };
          };
          nvim-web-devicons.enable = true;
        };

        statusline.lualine = {
          enable = true;
          theme = "catppuccin";
          sectionSeparator = {
            left = "";
            right = "";
          };
          componentSeparator = {
            left = "";
            right = "";
          };
        };

        telescope = {
          enable = true;
          extensions = [
            {
              name = "fzf";
              packages = [ pkgs.vimPlugins.telescope-fzf-native-nvim ];
              setup = {
                fzf = {
                  fuzzy = true;
                  override_file_sorter = true;
                  override_generic_sorter = true;
                  case_mode = "smart_case";
                };
              };
            }
          ];
          setupOpts = {
            defaults = {
              layout_config.horizontal.prompt_position = "top";
              sorting_strategy = "ascending";
            };
            pickers.find_files.hidden = true;
          };
        };

        filetree.nvimTree = {
          enable = true;
          setupOpts = {
            view = {
              width = 30;
              side = "left";
            };
            renderer = {
              highlight_git = true;
              indent_markers.enable = true;
            };
          };
        };

        # Barra de pestañas superior
        tabline.nvimBufferline = {
          enable = true;
        };

        git.gitsigns = {
          enable = true;
          setupOpts = {
            attach_to_untracked = true;
            current_line_blame = true;
            current_line_blame_opts = {
              delay = 0;
              virt_text_pos = "eol";
            };
          };
        };

        terminal.toggleterm = {
          enable = true;
          lazygit = {
            enable = true;
            mappings.open = "<leader>lg";
          };
        };

        dashboard.dashboard-nvim = {
          enable = true;
          setupOpts = {
            theme = "doom";
            config = {
              header = [
                "┌───────────────────────────┐"
                "│   Welcome back, Aaron!     │"
                "└───────────────────────────┘"
              ];
              center = [
                {
                  icon = " ";
                  desc = "Find file";
                  key = "f";
                  action = "Telescope find_files";
                }
                {
                  icon = " ";
                  desc = "Live grep";
                  key = "g";
                  action = "Telescope live_grep";
                }
                {
                  icon = " ";
                  desc = "File tree";
                  key = "e";
                  action = "NvimTreeToggle";
                }
                {
                  icon = " ";
                  desc = "Quit";
                  key = "q";
                  action = "qa";
                }
              ];
              footer = [ "Tip: press ? for which-key" ];
            };
          };
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
        };

        # Example: tiny Lua tweak when Nix doesn't cover a case.
        luaConfigRC.example = ''
          vim.api.nvim_create_autocmd("TextYankPost", {
            callback = function()
              vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
            end,
          })
        '';

      };

    };
  };

}
