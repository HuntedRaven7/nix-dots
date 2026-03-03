{ python3, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  firefox
  wget
  stoat-desktop
  element-desktop
  fastfetch
  zsh
  git
  ghostty
  protonplus
  cloudflared
  ];

  #services.ollama = {
  #  enable = true;
  #  package = pkgs.ollama-cuda;
  #};

  #users.groups.ollama = {};
  #  users.users.ollama = {
  #    isSystemUser = true;
  #    group = "ollama";
  #    extraGroups = [ "render" "video" ];
  #};

  services.xserver.windowManager.dwm.enable = true;
  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
    src = ../config/dwm;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    configure = {
      customRC = ''
        set clipboard+=unnamedplus
      '';
    };
  };

  services.flatpak.packages = [
    "com.discordapp.Discord"
    "it.mijorus.gearlever"
    "app.twintaillauncher.ttl"
    "org.kde.krita"
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
