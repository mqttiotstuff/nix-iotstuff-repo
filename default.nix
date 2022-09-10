{ pkgs ?
  import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/22.05.tar.gz";
  })
  { } }:

with pkgs;

let
  packages = rec {
    iotmonitor = callPackage ./pkgs/iotmonitor { };
    inherit
      pkgs; # similar to `pkgs = pkgs;` This lets callers use the nixpkgs version defined in this file.
  };
in packages

