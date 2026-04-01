{ pkgs, lib, ... }:
{
  plugins = {
    conform-nvim = {
      enable = false;
      settings = {
        format_on_save = ''
          function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            local function on_format(err)
              if err and err:match("timeout$") and slow_format_filetypes then
                slow_format_filetypes[vim.bo[bufnr].filetype] = true
              end
            end

            return { timeout_ms = 3000, lsp_fallback = true }, on_format
           end
        '';
        format_on_save_timeout = 3000;
        formatters_by_ft = {
          nix = [ "nixfmt" ];
          haskell = [ "fourmolu" ];
          javascript = [ "prettier" ];
          javascriptreact = [ "prettier" ];
          typescript = [ "prettier" ];
          typescriptreact = [ "prettier" ];
          json = [ "prettier" ];
          jsonc = [ "prettier" ];
          yaml = [ "prettier" ];
          html = [ "prettier" ];
          css = [ "prettier" ];
          markdown = [ "prettier" ];
        };
        formatters = {
          nixfmt = {
            command = lib.getExe pkgs.nixpkgs-fmt;
          };
          fourmolu = {
            command = lib.getExe pkgs.fourmolu;
          };
          prettier = {
            command = lib.getExe pkgs.prettier;
          };
        };
      };
    };
  };
}
