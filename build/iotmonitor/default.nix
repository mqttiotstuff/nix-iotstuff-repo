{
  pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/21.11.tar.gz") {}
}:

with pkgs;

let packages = rec {
	iotmonitor = stdenv.mkDerivation rec {
		pname = "iotmonitor";
		version = "0.2.3";

	  src = pkgs.fetchgit {
	    url = "https://github.com/mqttiotstuff/iotmonitor.git";
	    # computed with nix-prefetch-git, using the fetch submodules
	    sha256 = "07v3s7kasky439k0ijf2bm19d8linpdjdb8nsh9wib664hbyr7my";
	    fetchSubmodules = true;
	    rev = "aa6eb21464be7aed51893b465a295f07931f3247";
	  };

	  buildInputs = [
	    zig
	    git
	    cmake
	    leveldb
            pandoc
	  ];

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
	   buildInputs = [
	      iotmonitor
	   ];
	};

}; 
in
   packages
