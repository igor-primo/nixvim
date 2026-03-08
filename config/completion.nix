{
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        keymap = {
          preset = "default";
          "<CR>" = [ "accept" "fallback" ];
        };
        completion.list.selection = {
          preselect = true;
          auto_insert = false;
        };
        sources.default = [ "lsp" "path" "snippets" "buffer" ];
        appearance = {
          use_nvim_cmp_as_default = false;
          nerd_font_variant = "mono";
        };
      };
    };

    friendly-snippets.enable = true;

    copilot-vim = {
      enable = true;
      autoLoad = true;
    };
  };
}
