{ pkgs }:

{
  rxxxt = pkgs.callPackage ./rxxxt.nix { };
  mailproxy = pkgs.callPackage ./mailproxy.nix { };
}
