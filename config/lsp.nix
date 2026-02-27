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
        html.enable = true;
        cssls.enable = true;
      };
      inlayHints = true;
      onAttach = ''
        -- Disable LSP features for non-file URI scheme (e.g. fugitive://)
        if vim.uri_from_bufnr(bufnr):sub(1, 4) ~= "file" then
          client.server_capabilities.inlayHintProvider = false
        end
      '';
    };
  };

  extraConfigLua = ''
    -- Suppress noisy HLS importLens notification (cosmetic bug in HLS)
    local orig_show_message = vim.lsp.handlers["window/showMessage"]
    vim.lsp.handlers["window/showMessage"] = function(err, result, ctx, config)
      if result and result.message and result.message:find("importLens: Rule Failed") then
        return
      end
      if orig_show_message then
        orig_show_message(err, result, ctx, config)
      end
    end
  '';
}
