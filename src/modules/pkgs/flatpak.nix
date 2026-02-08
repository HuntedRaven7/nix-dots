{ python3, config, pkgs, ... }:

{
  services.flatpak.packages = [
    "com.discordapp.Discord"
    "io.podman_desktop.PodmanDesktop"
  ];
}
