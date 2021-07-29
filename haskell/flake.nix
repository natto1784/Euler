{
  description = "Haskell part of my junk";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
    utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, utils}: 
  utils.lib.eachDefaultSystem
  (system:
  let 
    pkgs = import nixpkgs {
      inherit system;
    };
    tools = (import ../stuff.nix pkgs).tools.haskell;
    lsp = (import ../stuff.nix pkgs).lsp.haskell;
    lists = pkgs.lib.lists;
    attrs = pkgs.lib.attrsets;
    buildInputs = (if lists.isList tools then tools else [tools]) ++ [lsp];
    strings = pkgs.lib.strings;
    pad = x: (strings.fixedWidthString 3 "0" (builtins.toString x));
  in
   {
    devShell = with pkgs; mkShell {
      buildInputs = buildInputs;
    };
  }
  );
}
