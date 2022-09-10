{ stdenv, fetchgit, cmake, leveldb, zig, git }:

stdenv.mkDerivation rec {
  pname = "iotmonitor";
  version = "0.2.5";

  src = fetchgit {
    url = "https://github.com/mqttiotstuff/iotmonitor.git";
    # computed with nix-prefetch-git, using the fetch submodules
    sha256 = "sha256-4UdCf/uHxa5GAbLYiaVwXxJSy3qZMftSO1efj5c/PZ0";
    fetchSubmodules = true;
    rev = "9df1d2ee085d672aeceec9582e5d6424189d060c";
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
