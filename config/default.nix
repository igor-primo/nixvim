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
    ./completion.nix
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
    vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "#1a1a2e" })
    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#888888" })
    vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "#1a1a2e" })
    vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#888888" })
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
