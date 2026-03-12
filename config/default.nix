{ pkgs, ... }:
{
  # Import all your configuration modules here
  imports = [
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
    ./keymaps.nix
    ./completion.nix
    ./bufferline.nix
    ./gitsigns.nix
    ./trouble.nix
    ./which-key.nix
    ./indent-blankline.nix
    ./todo-comments.nix
    ./comment.nix
    ./ccc.nix
  ];

  # colorscheme selected dynamically by OSC11.nvim
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
    set tabstop=2
    set shiftwidth=2
    set expandtab
    set autoread
    set foldmethod=expr
    set foldexpr=v:lua.vim.treesitter.foldexpr()
    set foldlevel=99
    set foldlevelstart=99
    set foldenable
    set laststatus=3
  '';

  autoCmd = [
    {
      event = [ "FocusGained" "BufEnter" "CursorHold" "CursorHoldI" ];
      pattern = "*";
      command = "checktime";
    }
    {
      event = [ "VimEnter" ];
      pattern = "*";
      command = "Neotree show";
    }
  ];

  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "osc11";
      src = pkgs.fetchFromGitHub {
        owner = "afonsofrancof";
        repo = "OSC11.nvim";
        rev = "919e015336b737c3c567f56de677740684a41cf5";
        hash = "sha256-s7HyMf90WdO0pyk1EQeRzOwK+5jbPDaoooK/sKroCw4=";
      };
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "lush-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "rktjmp";
        repo = "lush.nvim";
        rev = "9c60ec2279d62487d942ce095e49006af28eed6e";
        sha256 = "18rafbyraxaf99km1ij0xcp9vnmwmwcglynwm33fy3fz5aibcc34";
      };
    })
    (pkgs.runCommand "vimplugin-zenbones" { } ''
      cp -r ${pkgs.fetchFromGitHub {
        owner = "zenbones-theme";
        repo = "zenbones.nvim";
        rev = "22b7fb75593412e0dc81b4bdefae718e9e84aa82";
        sha256 = "1jc5q6fl5jnl93vzwdb2970s08d7c8wa8m2bdfzxdrvzl0qrrxyr";
      }}/. $out
    '')
    (pkgs.vimUtils.buildVimPlugin {
      name = "mellifluous-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "ramojus";
        repo = "mellifluous.nvim";
        rev = "9948359e1536b4171615f7280e61e17620e3fd45";
        sha256 = "1x7fjvwlg1g1fy716mc87hwa5zdlssj4z2nvxk5lnmvi76qlgps0";
      };
    })
  ];

  extraConfigLua = ''
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "neo-tree" then
          vim.cmd("quit")
        end
      end,
    })

    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#888888" })
    vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "#1a1a2e" })
    vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#888888" })

    vim.o.background = "light"
    vim.cmd("colorscheme zenbones")
    require('osc11').setup({
      on_dark = function()
        vim.o.background = "dark"
        vim.cmd("colorscheme zenbones")
        require('lualine').setup({ options = { theme = 'zenbones' } })
      end,
      on_light = function()
        vim.o.background = "light"
        vim.cmd("colorscheme zenbones")
        require('lualine').setup({ options = { theme = 'zenbones' } })
      end,
    })
  '';
}
