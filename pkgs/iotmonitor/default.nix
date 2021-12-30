{ stdenv, fetchgit, cmake, leveldb, zig, git }:

stdenv.mkDerivation rec {
  pname = "iotmonitor";
  version = "0.2.5";

  src = fetchgit {
    url = "https://github.com/mqttiotstuff/iotmonitor.git";
    # computed with nix-prefetch-git, using the fetch submodules
    sha256 = "1fp1yarqzpyaillmgxws2nck8zjfjk9qcgqrk3hndqaq1sy11wl2";
    fetchSubmodules = true;
    rev = "342d07d0ec4635cfd2aa109e1dcfd5ab6534c5c7";
  };

  buildInputs = [ zig git cmake leveldb ];

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

}
