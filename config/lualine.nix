{
  plugins = {
    lualine = {
      enable = true;
      autoLoad = true;
      settings = {
        options = {
          theme = "auto";
          disabled_filetypes = {
            statusline = [
              "dap-repl"
            ];
          };
        };
      };
    };
  };
}
