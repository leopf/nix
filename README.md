# nix

Personal Nix flake with packages I use for my own stuff.

## Usage

Add as a flake input:

```nix
inputs.leopf-pkgs.url = "github:leopf/nix";
```

Then consume the overlay or individual packages:

```nix
{ inputs, pkgs, ... }:
{
  # via overlay
  nixpkgs.overlays = [ inputs.leopf-pkgs.overlays.default ];

  # or individual packages
  environment.systemPackages = [
    inputs.leopf-pkgs.packages.${pkgs.system}.mailproxy
    inputs.leopf-pkgs.packages.${pkgs.system}.rxxxt
  ];
}
```

## Packages

| Package | Description |
|---------|-------------|
| [mailproxy](https://github.com/leopf/mailproxy) | IMAP/SMTP proxy handling OAuth2 and local SQLite backup |
| [rxxxt](https://github.com/leopf/rxxxt) | Python web framework |

## Build

```bash
nix build .#mailproxy
nix run .#mailproxy -- --help
nix fmt        # format nix files
```
