{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     vim
     git
     alacritty
     unstablePkgs.discord
    ];
}
