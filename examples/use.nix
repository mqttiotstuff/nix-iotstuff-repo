{ nixpkgs ? <nixpkgs>, iotstuff ? import (fetchTarball
  "https://github.com/mqttiotstuff/nix-iotstuff-repo/archive/9b12720.tar.gz")
  { } }:

iotstuff.pkgs.mkShell rec { buildInputs = [ iotstuff.iotmonitor ]; }

