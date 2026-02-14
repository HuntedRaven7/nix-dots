{ python3, config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  firefox
  zed-editor
  gearlever
  xwayland-satellite
  nwg-look
  pavucontrol
  krita
  lua
  luajit
  luajitPackages.lua-lsp
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

  programs.niri.enable = true;  

  programs.dank-material-shell = {
  enable = true;

  systemd = {
    enable = true;             # Systemd service for auto-start
    restartIfChanged = true;   # Auto-restart dms.service when dank-material-shell changes
  };

  # Core features
  enableSystemMonitoring = true;     # System monitoring widgets (dgop)
  enableVPN = true;                  # VPN management widget
  enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
  enableAudioWavelength = true;      # Audio visualizer (cava)
  enableCalendarEvents = true;       # Calendar integration (khal)
  enableClipboardPaste = true;       # Pasting items from the clipboard (wtype)

  plugins = {
      # Simply enable plugins by their ID (from the registry)
      dankBatteryAlerts.enable = true;
      dockerManager.enable = true;
      
      # Add plugin-specific settings
      mediaPlayer = {
        enable = true;

        # You can only define settings here if using the home-manager module
        settings = {
          preferredSource = "spotify";
        };
      };
    };
  };


  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
  };

  users.groups.ollama = {};
    users.users.ollama = {
      isSystemUser = true;
      group = "ollama";
      extraGroups = [ "render" "video" ];
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
    "org.kde.neochat"
    "com.mattjakeman.ExtensionManager"
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
