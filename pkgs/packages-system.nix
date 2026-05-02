{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     vim
     git
     pkgs.unstablePkgs discord
    ];
}
