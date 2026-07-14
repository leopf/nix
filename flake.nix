{
  description = "leopf's personal nix packages";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      eachSystem = f: nixpkgs.lib.genAttrs systems (system: f system);
    in
    {
      packages = eachSystem (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./pkgs { inherit pkgs; } // { default = self.packages.${system}.mailproxy; });

      overlays.default = final: _prev: import ./pkgs { pkgs = final; };

      formatter = eachSystem (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
    };
}
