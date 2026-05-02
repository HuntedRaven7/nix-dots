{ config, pkgs, ... }:

{
  packages = with pkgs; [
     vim
     git
     pkgs.unstablePkgs = discord
    ];
}
