{ pkgs ?
  import (fetchTarball {
    # nixpkgs-unstable (2021-10-28)
    url = "https://github.com/NixOS/nixpkgs/archive/d9c13cf44ec1b6de95cb1ba83c296611d19a71ae.tar.gz";
#    sha256 = "1rqp9nf45m03mfh4x972whw2gsaz5x44l3dy6p639ib565g24rmh";
  })
# "https://github.com/NixOS/nixpkgs/archive/21.11.tar.gz")
  { } }:

with pkgs;

let
  packages = rec {
    iotmonitor = callPackage ./pkgs/iotmonitor { };

    # chord_custom_sg = callPackage ./pkgs/chord { simgrid = custom_simgrid; };
    # custom_simgrid = callPackage ./pkgs/simgrid/custom.nix {};

    inherit
      pkgs; # similar to `pkgs = pkgs;` This lets callers use the nixpkgs version defined in this file.
  };
in packages

