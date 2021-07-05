
# How to build/run
## Build/Run with nix 
Run this inside this directory to build every problem
```
nix build
```
To build or run a particular problem run
```
nix build/run .#p<x>
```
replace <x> with the problem number<br>
Make sure <x> is of the fixed width `3` prefixed with zeroes<br>
For example: <x> for Problem-23 will be `023` 

## Build/Run with cargo
Run this inside this directory to build every problem
```
cargo build
```
To build or run a particular problem run
```
cargo build/run -p p<x>
```
replace <x> with the problem number

# Development Environment with nix
Just run 
```
nix develop
```
inside this directory to get the rust nightly toolchain and rust-analyzer
