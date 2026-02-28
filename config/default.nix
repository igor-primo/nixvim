{
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./colorschemes.nix
    ./telescope.nix
    ./neo-tree.nix
    ./lsp.nix
    ./flash.nix
    ./lualine.nix
    ./tmux-navigator.nix
    ./conform.nix
    ./neogit.nix
    ./fugitive.nix
    ./treesitter.nix
    ./ts-autotag.nix
    ./emmet.nix
  ];

  colorscheme = "github_dark_high_contrast";
  clipboard = {
    register = "unnamedplus";
    providers = {
      xclip = {
        enable = true;
      };
    };
  };

  extraConfigVim = ''
    set number
    set linebreak
    set relativenumber
    set mouse=a
    set incsearch
    set hlsearch
    set ignorecase
    set smartcase
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set autoread
  '';

  autoCmd = [
    {
      event = [ "FocusGained" "BufEnter" "CursorHold" "CursorHoldI" ];
      pattern = "*";
      command = "checktime";
    }

  ];

  keymaps = [
    {
      action = ":Neotree toggle<CR>";
      key = "<Space>e";
      options = {
        silent = true;
      };
    }
    {
      action = ":w<CR>";
      key = "<C-s>";
      options = {
        silent = true;
      };
    }
    {
      action = ":messages<CR>";
      key = "<leader>m";
      options = {
        silent = true;
      };
    }
    {
      mode = "n";
      key = "s";
      action = "<cmd>lua require('flash').jump()<CR>";
      options = {
        silent = true;
        desc = "Flash jump";
      };
    }
    {
      key = "<leader>g";
      action = ":Neogit<CR>";
      options = {
        silent = true;
        desc = "Neogit";
      };
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = ":Git<CR>";
      options = {
        silent = true;
        desc = "Git status";
      };
    }
    {
      mode = "n";
      key = "<leader>gc";
      action = ":Git commit<CR>";
      options = {
        silent = true;
        desc = "Git commit";
      };
    }
    {
      mode = "n";
      key = "<leader>gP";
      action = ":Git push<CR>";
      options = {
        silent = true;
        desc = "Git push";
      };
    }
    {
      mode = "n";
      key = "<leader>gp";
      action = ":Git pull<CR>";
      options = {
        silent = true;
        desc = "Git pull";
      };
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = ":Gdiffsplit<CR>";
      options = {
        silent = true;
        desc = "Git diff split";
      };
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = ":Git blame<CR>";
      options = {
        silent = true;
        desc = "Git blame";
      };
    }
    {
      mode = "n";
      key = "<leader>gl";
      action = ":Git log --oneline<CR>";
      options = {
        silent = true;
        desc = "Git log";
      };
    }
    {
      mode = "n";
      key = "<leader>gB";
      action = ":GBrowse<CR>";
      options = {
        silent = true;
        desc = "Git browse";
      };
    }
    {
      mode = "n";
      key = "<leader>tl";
      action = ":colorscheme github_light_high_contrast<CR>";
      options = {
        silent = true;
        desc = "GitHub light high contrast theme";
      };
    }
    {
      mode = "n";
      key = "<leader>td";
      action = ":colorscheme github_dark_high_contrast<CR>";
      options = {
        silent = true;
        desc = "GitHub dark high contrast theme";
      };
    }
    {
      mode = "n";
      key = "<leader>g/";
      action.__raw = ''
        function()
          vim.ui.input({ prompt = "Git log -S (pickaxe): " }, function(input)
            if input and input ~= "" then
              vim.cmd("Git log -S" .. vim.fn.shellescape(input) .. " --oneline")
            end
          end)
        end
      '';
      options = {
        silent = true;
        desc = "Git pickaxe search";
      };
    }
  ];
}
