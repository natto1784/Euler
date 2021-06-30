super:
{
  tools = with super.pkgs; {
    c = gcc;
    rust = rust-bin.nightly.latest.default;
    js = nodejs;
    ts = nodejs;
    clisp = clisp;
    python = [python3 python2];
    haskell = ghc;
  };
  lsp = with super.pkgs; {
    c = clang;
    rust = rust-analyzer;
    js = nodePackages.typescript-language-server;
    ts = nodePackages.typescript-language-server;
    python = python3Packages.jedi;
    haskell = haskell-language-server;
  };
}
