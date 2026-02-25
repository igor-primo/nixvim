{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        hls = {
          enable = true;
          package = null;
          installGhc = false;
          settings = {
            haskell = {
              plugin = {
                importLens = {
                  codeActionsOn = false;
                  codeLensOn = true;
                };
              };
            };
          };
        };
        html.enable = true;
        cssls.enable = true;
      };
      inlayHints = true;
      onAttach = ''
        -- Disable LSP features for non-file URI schemes (e.g. fugitive://)
        if vim.uri_from_bufnr(bufnr):sub(1, 4) ~= "file" then
          client.server_capabilities.inlayHintProvider = false
        end
      '';
    };
  };
}
