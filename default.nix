{
  pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/21.11.tar.gz") {}
}:

with pkgs;

let
  packages = rec {
    chord = callPackage ./pkgs/iotmonitor {};
    # chord_custom_sg = callPackage ./pkgs/chord { simgrid = custom_simgrid; };
    # custom_simgrid = callPackage ./pkgs/simgrid/custom.nix {};

    inherit pkgs; # similar to `pkgs = pkgs;` This lets callers use the nixpkgs version defined in this file.
  };
in
  packages


