{
  description = "Main flake of my junk";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
    utils.url = github:numtide/flake-utils;
    rust-overlay.url = github:oxalica/rust-overlay;
  };

  outputs = { self, nixpkgs, utils, rust-overlay }: 
  utils.lib.eachDefaultSystem
  (system:
  let 
    overlays = [ (import rust-overlay) ];
    pkgs = import nixpkgs {
      inherit system overlays;
    };
    tools = (import ./stuff.nix pkgs).tools;
    lsp = (import ./stuff.nix pkgs).lsp;
    lists = pkgs.lib.lists;
    attrs = pkgs.lib.attrsets;
    availableLsps = attrs.mapAttrsToList (name: _: name) lsp;
  in
  (builtins.mapAttrs (name: value: ( with pkgs; mkShell {
    buildInputs = (if lists.isList value then value else [value]) ++ lists.optional (builtins.elem name availableLsps) lsp."${name}";
  })) tools) //
  {
    devShell = with pkgs; mkShell {
      buildInputs = lists.flatten (lists.forEach [tools lsp] (x: attrs.mapAttrsToList (_: value: value) x));
    };
    tools = with pkgs; mkShell {
      buildInputs = attrs.mapAttrsToList (_: value: value) tools;
    };
    lsp = with pkgs; mkShell {
      buildInputs = attrs.mapAttrsToList (_: value: value) lsp;
    };
  }
  );
}
