{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     vim
     git
     unstablePkgs.vivaldi
     alacritty
     unstablePkgs.discord
    ];
}
