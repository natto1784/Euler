
# How to build/run
## Build/Run with nix 
No nix build/run support, cuz I'm too dumb to figure out how to get it working with cabal.project (haskell.nix cache doesn't work with flakes)

## Build/Run with cabal
Run this inside this directory to build every problem
```
cabal build all
```
To build or run a particular problem
```
cabal build p[x]
```
replace [x] with the problem number<br>
Make sure [x] is of the fixed width `3` prefixed with zeroes<br>
For example: [x] for Problem-23 will be `023` 

# Development Environment with nix
Just run 
```
nix develop
```
inside this directory to get cabal-install, ghc, haskell-language-server (hls)
