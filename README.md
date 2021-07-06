### Update
My entrance exams are here, adios

# Euler Project(?)
Made this new repo to just add all the random euler project shit that ill ever do (yeah deleted my old repo by the same name that had quite a few shitty code files). This time I'll use some different languages because I've nothing better to do (maybe it will help me practice languages that I'll never use :D)

# Developer environment using nix (I don't know why I added this [I really don't])
To use a nix shell with all the required tools and LSP servers for these languages, run this inside this directory
```
nix develop
```
To use only tools or LSP servers run
```
nix develop .#tools.<system_arch-os>
```
or
```
nix develop .#lsp.<system_arch-os>
```
Replace <system_arch-os> with your system architecture and os seperated by '-'<br>
It can be one of the following
- x86_64-linux
- aarch64-linux
- x86_64-darwin
- i686-linux

## Language Specific
For using only the tools for a specific language (with the LSP server), go into the language directory and run
```
nix develop
```
or run this from the root directory
```
nix develop .#<language>.<system_arch-os>
```

