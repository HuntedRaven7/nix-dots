{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     vim
     git
     vivaldi
     alacritty
     unstablePkgs.discord
     vivaldi-ffmpeg-codecs
    ];
}
