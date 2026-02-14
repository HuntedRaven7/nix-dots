{ python3, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  brave
  neovim
  gearlever
  nwg-look
  pavucontrol
  krita
  fastfetch
  godot-mono
  zsh
  git
  ghostty
  protonplus
  prismlauncher
  emacs
  dotnet-sdk
  dotnet-aspnetcore
  dotnet-runtime
  cloudflared
  ];

  services.flatpak.packages = [
    "com.discordapp.Discord"
    "org.kde.neochat"
    "com.mattjakeman.ExtensionManager"
    "page.tesk.Refine"
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
