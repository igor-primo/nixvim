{
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        keymap.preset = "default";
        sources.default = [ "lsp" "path" "snippets" "buffer" ];
        appearance = {
          use_nvim_cmp_as_default = false;
          nerd_font_variant = "mono";
        };
      };
    };

    copilot-vim = {
      enable = true;
      autoLoad = true;
    };
  };
}
