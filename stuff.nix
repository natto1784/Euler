super:
{
  tools = with super.pkgs; {
    c = [ gcc gnumake ];
    rust = rust-bin.nightly.latest.default;
    ts = [ nodePackages.typescript nodejs ];
    clisp = clisp;
    python = [ python3 python2 ];
    haskell = [ ghc cabal-install ] ;
  };
  lsp = with super.pkgs; {
    c = ccls;
    rust = rust-analyzer;
    ts = nodePackages.typescript-language-server;
    python = python3Packages.python-language-server;
    haskell = haskell-language-server;
  };
}
