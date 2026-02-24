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
        };
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
