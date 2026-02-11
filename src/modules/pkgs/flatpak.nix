{ python3, config, pkgs, ... }:

{
  services.flatpak.packages = [
    "com.discordapp.Discord"
    "org.kde.neochat"
  ];
}
