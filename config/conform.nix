{ pkgs, lib, ... }:
{
  plugins = {
    conform-nvim = {
      enable = true;
      settings = {
        format_on_save = ''
          function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            local function on_format(err)
              if err and err:match("timeout$") then
                slow_format_filetypes[vim.bo[bufnr].filetype] = true
              end
            end

            return { timeout_ms = 200, lsp_fallback = true }, on_format
           end
        '';
        format_on_save_timeout = 1000;
        formatters_by_ft = {
          nix = [ "nixfmt" ];
          haskell = [ "fourmolu" ];
        };
        formatters = {
          nixfmt = {
            command = lib.getExe pkgs.nixpkgs-fmt;
          };
          fourmolu = {
            command = lib.getExe pkgs.fourmolu;
          };
        };
      };
    };
  };
}
