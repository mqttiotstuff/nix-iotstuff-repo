

## Testing using flake with iotmonitor

on current nix version (2.5 +), the submodule parameter is not yet supported in 2.4, has been added recently

nix shell --no-write-lock-file "git+https://github.com/mqttiotstuff/iotmonitor?ref=PFR_eval_http_server&rev=f77069dc1edfbbcec720ed88eb75b287f740f5e5&submodules=1"


