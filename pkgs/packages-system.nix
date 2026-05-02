{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     vim
     git
     vivaldi
     alacritty
     (vivaldi.override {
      proprietaryCodecs = true;
     })
     vivaldi-ffmpeg-codecs
     vivaldi-widevine
     unstablePkgs.discord
    ];
}
