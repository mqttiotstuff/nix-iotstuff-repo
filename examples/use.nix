{ nixpkgs ? <nixpkgs>, iotstuff ? import (fetchTarball
  "https://github.com/mqttiotstuff/nix-iotstuff-repo/archive/a901eabddc153f99435858a760b2de393ea5f831.tar.gz")
  { } }:

iotstuff.pkgs.mkShell rec { buildInputs = [ iotstuff.iotmonitor ]; }

