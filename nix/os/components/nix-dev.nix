{ config, pkgs, ... }:

{
  imports = [
    ./vscode/nix.nix
  ];

  environment.systemPackages = with pkgs; [
    btop
    curl
    gh
    git
    neovim
  ];
}
