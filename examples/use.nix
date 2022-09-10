{ nixpkgs ? <nixpkgs>, iotstuff ? import (fetchTarball
  "https://github.com/mqttiotstuff/nix-iotstuff-repo/archive/0a193e8dd9e9a46c3411a84ac2afb59eb2433a9b.tar.gz")
  { } }:

iotstuff.pkgs.mkShell rec { buildInputs = [ iotstuff.iotmonitor ]; }

