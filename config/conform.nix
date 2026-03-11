{ pkgs, lib, ... }:
let
  fourmoluConfig = pkgs.writeText "fourmolu.yaml" ''
    extensions:
      - OverloadedStrings
      - NoImplicitPrelude
      - ImplicitParams
      - Rank2Types
      - DisambiguateRecordFields
      - NamedFieldPuns
      - DuplicateRecordFields
      - OverloadedLabels
      - FlexibleContexts
      - TypeSynonymInstances
      - FlexibleInstances
      - QuasiQuotes
      - TypeFamilies
      - PackageImports
      - ScopedTypeVariables
      - RecordWildCards
      - TypeApplications
      - DataKinds
      - InstanceSigs
      - DeriveGeneric
      - MultiParamTypeClasses
      - TypeOperators
      - DeriveDataTypeable
      - MultiWayIf
      - UndecidableInstances
      - BlockArguments
      - PartialTypeSignatures
      - LambdaCase
      - DefaultSignatures
      - EmptyDataDeriving
      - BangPatterns
      - FunctionalDependencies
      - StandaloneDeriving
      - DerivingVia
      - ImportQualifiedPost
      - OverloadedRecordDot
  '';
in
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
            prepend_args = [ "--config" "${fourmoluConfig}" ];
          };
          prettier = {
            command = lib.getExe pkgs.prettier;
          };
        };
      };
    };
  };
}
