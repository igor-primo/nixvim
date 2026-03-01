{
  plugins = {
    telescope = {
      enable = true;
      autoLoad = true;
      extensions = {
        fzf-native = {
          enable = true;
        };
      };
      keymaps = {
        "<C-p>" = {
          action = "git_files";
          options = {
            desc = "Telescope Git Files";
          };
        };
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fh" = "help_tags";
        "<leader>ff" = "find_files";
      };
    };
  };
}
