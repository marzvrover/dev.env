{ config, pkgs, ... }:
{
  config = {
    environment.systemPackages = with pkgs; [
      (vscode-with-extensions.override {
        vscodeExtensions = with vscode-extensions; [

        ] ++ (import ./extension-packs/github.copilot.nix { inherit vscode-extensions; });
      })
    ];
  };
} 
