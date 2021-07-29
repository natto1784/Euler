{
  description = "Rust part of my junk";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
    utils.url = github:numtide/flake-utils;
    rust-overlay.url = github:oxalica/rust-overlay;
  };

  outputs = { self, nixpkgs, utils, rust-overlay}: 
  utils.lib.eachDefaultSystem
  (system:
  let 
    overlays = [ (import rust-overlay) ];
    pkgs = import nixpkgs {
      inherit system overlays;
    };
    tools = (import ../stuff.nix pkgs).tools.rust;
    lsp = (import ../stuff.nix pkgs).lsp.rust;
    lists = pkgs.lib.lists;
    attrs = pkgs.lib.attrsets;
    strings = pkgs.lib.strings;
    package = rec {
      pname = "euler";
      version = "0.1.0";
      src = ./. ;
      nativeBuildInputs = with pkgs; [
        rust-bin.nightly.latest.default
      ];
      cargoSha256 = "sha256-p9fHnQRMT/gPoAFuwNSWHI7LS85IiMNnsqij/FggOKM=";
    };
    pad = x: (strings.fixedWidthString 3 "0" (builtins.toString x));
  in
  {
    devShell = with pkgs; mkShell {
      buildInputs = (if lists.isList tools then tools else [tools]) ++ [lsp];
    };
    defaultPackage = pkgs.rustPlatform.buildRustPackage package;
    packages = attrs.genAttrs (lists.forEach (lists.tail (lists.genList (x: x) 11)) (x: "p${pad x}")) 
    (name: pkgs.rustPlatform.buildRustPackage (package // {buildAndTestSubdir = "./${name}";}));
    apps = attrs.genAttrs (lists.forEach (lists.tail (lists.genList (x: x) 11)) (x: "p${pad x}")) (name: {
      type = "app";
      program = "${self.packages.${system}.${name}}/bin/${name}";
    });
  }
  );
}
