{ stdenv, fetchgit, cmake, leveldb, zig, git }:

stdenv.mkDerivation rec {
  pname = "iotmonitor";
  version = "0.2.5";

  src = fetchgit {
    url = "https://github.com/mqttiotstuff/iotmonitor.git";
    # computed with nix-prefetch-git, using the fetch submodules
    sha256 = "1x9k4kxc8k6z92pcxkm17ykybi6y67qvxyppzx53zrx3gslz6ivz";
    fetchSubmodules = true;
    rev = "7d847fd599df612ffb6036d00f3b61276b4a640f";
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
