{ python3, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  firefox
  zed-editor
  gearlever
  xwayland-satellite
  nwg-look
  pavucontrol
  element-desktop
  ramalama
  krita
  fastfetch
  godot-mono
  zsh
  git
  ghostty
  protonplus
  prismlauncher
  dotnet-sdk
  dotnet-aspnetcore
  dotnet-runtime
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
