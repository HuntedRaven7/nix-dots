{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     vim
     git
     alacritty
     gearlever
     unstablePkgs.discord
    ];
}
