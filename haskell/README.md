
# How to build/run
## Build/Run with nix 
To build or run a particular problem run
```
nix build/run .#p[x]
```
replace [x] with the problem number<br>
Make sure [x] is of the fixed width `3` prefixed with zeroes<br>
For example: [x] for Problem-23 will be `023` 

## Build/Run with cabal
To build or run a particular problem, `cd` into that directory and run
```
cabal build/run
```

# Development Environment with nix
Just run 
```
nix develop
```
inside this directory to get cabal-install, ghc, haskell-language-server (hls)
