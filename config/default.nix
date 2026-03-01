{ pkgs, ... }:
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
    ./keymaps.nix
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
  '';

  autoCmd = [
    {
      event = [ "FocusGained" "BufEnter" "CursorHold" "CursorHoldI" ];
      pattern = "*";
      command = "checktime";
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
  ];

  extraConfigLua = ''
    require('osc11').setup({
      on_dark = function()
        vim.cmd("colorscheme github_dark_high_contrast")
      end,
      on_light = function()
        vim.cmd("colorscheme github_light_high_contrast")
      end,
    })
  '';
}
