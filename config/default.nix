{
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./colorschemes.nix
    ./telescope.nix
    ./neo-tree.nix
    ./lsp.nix
    ./flash.nix
    ./lightline.nix
    ./tmux-navigator.nix
    ./conform.nix
    ./neogit.nix
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
    set tabstop=4
    set shiftwidth=4
    set expandtab
  '';

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
  ];
}
