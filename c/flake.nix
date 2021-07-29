{
  description = "C part of my junk";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
    utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, utils }: 
  utils.lib.eachDefaultSystem
  (system:
  let 
    pkgs = import nixpkgs {
      inherit system;
    };
    tools = (import ../stuff.nix pkgs).tools.c;
    lsp = (import ../stuff.nix pkgs).lsp.c;
    lists = pkgs.lib.lists;
    attrs = pkgs.lib.attrsets;
    strings = pkgs.lib.strings;
    buildInputs = (if lists.isList tools then tools else [tools]) ++ [lsp];
    pad = x: (strings.fixedWidthString 3 "0" (builtins.toString x));

  in
  {
    devShell = with pkgs; mkShell {
      buildInputs = buildInputs;
    };
    defaultPackage = pkgs.stdenv.mkDerivation {
      pname = "euler";
      version = "0.1.0";
      src = ./.;
      nativeBuildInputs = buildInputs;
      installPhase = ''
        mkdir -p $out/bin
        cp bin/* $out/bin
      '';
    };
    packages = attrs.genAttrs (lists.forEach (lists.tail (lists.genList (x: x) 8)) (x: "p${pad x}")) 
    (name: pkgs.stdenv.mkDerivation {
      pname = name;
      version = "0.1.0";
      src = ./.;
      nativeBuildInputs = buildInputs;
      buildPhase = ''
        cd ${name}
        make
      '';
      installPhase = ''
        mkdir -p $out/bin
        cp ${name} $out/bin
      '';
    });
  }
  );
}
