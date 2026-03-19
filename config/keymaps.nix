{
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
      key = "<leader>gb";
      action = ":Gitsigns blame<CR>";
      options = {
        silent = true;
        desc = "Gitsigns blame";
      };
    }
    {
      mode = "n";
      key = "<leader>tl";
      action.__raw = ''
        function()
          -- vim.cmd("colorscheme zenbones")
          vim.o.background = "light"
          require('lualine').setup({ options = { theme = 'zenbones' } })
        end
      '';
      options = {
        silent = true;
        desc = "GitHub light high contrast theme";
      };
    }
    {
      mode = "n";
      key = "<leader>td";
      action.__raw = ''
        function()
          -- vim.cmd("colorscheme zenbones")
          vim.o.background = "dark"
          require('lualine').setup({ options = { theme = 'zenbones' } })
        end
      '';
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
    # Move current line down (normal mode)
    {
      mode = "n";
      key = "<A-j>";
      action = "<cmd>move .+1<CR>==";
      options = {
        silent = true;
        desc = "Move line down";
      };
    }
    # Move current line up (normal mode)
    {
      mode = "n";
      key = "<A-k>";
      action = "<cmd>move .-2<CR>==";
      options = {
        silent = true;
        desc = "Move line up";
      };
    }
    # Move selected block down (visual mode)
    {
      mode = "v";
      key = "<A-j>";
      action = ":move '>+1<CR>gv=gv";
      options = {
        silent = true;
        desc = "Move selection down";
      };
    }
    # Move selected block up (visual mode)
    {
      mode = "v";
      key = "<A-k>";
      action = ":move '<-2<CR>gv=gv";
      options = {
        silent = true;
        desc = "Move selection up";
      };
    }
    {
      mode = "n";
      key = "<leader>uw";
      action.__raw = ''
        function()
          vim.wo.wrap = not vim.wo.wrap
          vim.notify("Local wrap " .. (vim.wo.wrap and "enabled" or "disabled"))
        end
      '';
      options = {
        silent = true;
        desc = "Toggle wrap (local window)";
      };
    }
    {
      mode = "n";
      key = "<leader>uW";
      action.__raw = ''
        function()
          local new_val = not vim.go.wrap
          vim.go.wrap = new_val
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            vim.wo[win].wrap = new_val
          end
          vim.notify("Global wrap " .. (new_val and "enabled" or "disabled"))
        end
      '';
      options = {
        silent = true;
        desc = "Toggle wrap (all windows)";
      };
    }
    {
      mode = "n";
      key = "<leader>cp";
      action = "<cmd>CccPick<CR>";
      options = {
        silent = true;
        desc = "Color picker";
      };
    }
    {
      mode = "n";
      key = "<leader>ch";
      action = "<cmd>CccHighlighterToggle<CR>";
      options = {
        silent = true;
        desc = "Toggle color highlighting";
      };
    }
    {
      mode = "n";
      key = "<leader>z";
      action = "<cmd>ZenMode<CR>";
      options = {
        silent = true;
        desc = "Toggle Zen Mode";
      };
    }
  ];
}
