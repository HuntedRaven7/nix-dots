{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  neovim
  brave
  gearlever
  nwg-look
  pavucontrol
  krita
  firefox
  fastfetch
  godot-mono
  zsh
  git
  ghostty
  protonplus
  prismlauncher
  rofi
  waypaper
  dotnet-sdk
  dotnet-aspnetcore
  dotnet-runtime
  cloudflared
  ];

  programs.gamemode.enable = true;
  programs.steam = {
      enable = true; # install steam
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-color-emoji
  fira-code
  fira-code-symbols
  ];

}
