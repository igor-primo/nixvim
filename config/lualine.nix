{
  plugins = {
    lualine = {
      enable = true;
      autoLoad = true;
      settings = {
        options = {
          theme = "ayu_dark";
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
