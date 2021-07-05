
# How to build/run
## Build/Run with nix 
Run this inside this directory to build every problem
```
nix build
```
To build or run a particular problem run
```
nix build/run .#p[x]
```
replace [x] with the problem number<br>
Make sure [x] is of the fixed width `3` prefixed with zeroes<br>
For example: [x] for Problem-23 will be `023` 

## Build with (GNU)make
Run this inside this directory to build every problem
```
make
```
All the files will be built into the `bin` directory

To build or run a particular problem
```
cd p[x] && make
```
Again, replace [x] with the problem number<br>
The file will be built in the problem's directory

# Development Environment with nix
Just run 
```
nix develop
```
inside this directory to get gdb, lldb, gcc, gnumake and ccls
