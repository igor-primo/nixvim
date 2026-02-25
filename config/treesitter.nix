{
  plugins = {
    treesitter = {
      enable = true;
      autoLoad = true;
      settings = {
        ensure_installed = [ "html" "css" "javascript" "haskell" "nix" ];
        highlight = {
          enable = true;
        };
      };
    };
  };
}
