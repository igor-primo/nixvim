{
  plugins = {
    lualine = {
      enable = true;
      autoLoad = true;
      settings = {
        options = {
          disabled_filetypes = {
            __unkeyed-1 = "neo-tree";
            statusline = [
              "dap-repl"
            ];
          };
        };
      };
    };
  };
}
