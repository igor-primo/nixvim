{
  plugins = {
    treesitter = {
      enable = true;
      autoLoad = true;
      settings = {
        ensure_installed = [
          "html"
          "css"
          "javascript"
          "haskell"
          "nix"
          "typescript"
          "tsx"
          "json"
          "jsonc"
          "yaml"
          "markdown"
          "markdown_inline"
          "lua"
          "bash"
          "toml"
        ];
        highlight = {
          enable = true;
        };
      };
    };
  };
}
