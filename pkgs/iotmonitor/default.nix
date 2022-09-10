{ pkgs ?
  import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/21.11.tar.gz")
  { } }:

with pkgs;

let
  packages = rec {
    iotmonitor = stdenv.mkDerivation rec {
      pname = "iotmonitor";
      version = "0.2.7";

      src = pkgs.fetchgit {
        url = "https://github.com/mqttiotstuff/iotmonitor.git";

        # computed with nix-prefetch-git, using the fetch submodules option
        sha256 = "1bipm1fwbgbrqcy4aixx99r4pxks42ln4nb94cj0qyc7q2a3845k";
        fetchSubmodules = true;
        rev = "v0.2.7";
      };

      buildInputs = [ zig git cmake leveldb pandoc ];

      configurePhase = ''
        ls
        zig version
      '';

      buildPhase = ''
        make
        zig build
      '';

      installPhase = ''
        mkdir -p $out/bin
        mv bin/iotmonitor $out/bin
      '';
    };

    expEnv = mkShell rec {
      name = "iotmonitorEnv";
      buildInputs = [ iotmonitor ];
    };

  };
in packages
