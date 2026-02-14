# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    ./modules/shell/zsh.nix
    ./modules/pkgs/pkg.nix
#    ./modules/config/nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [ 

    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # Cachix For Anime Games
      substituters = [ "https://ezkea.cachix.org" ];
      trusted-public-keys = [ "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" ];
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };
    # Opinionated: disable channels
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  # FIXME: Add the rest of your current configuration

  # TODO: Set your hostname
  networking.hostName = "nix";

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    edward = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager" "audio"];
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";

  programs.dank-material-shell.greeter = {
  enable = true;
  compositor.name = "niri";  # Or "hyprland" or "sway"
  };
  services.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
  description = "polkit-gnome-authentication-agent-1";
  wantedBy = [ "graphical-session.target" ];
  wants = [ "graphical-session.target" ];
  after = [ "graphical-session.target" ];
  serviceConfig = {
    Type = "simple";
    ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    Restart = "on-failure";
    RestartSec = 1;
    TimeoutStopSec = 10;
    };
  };

  services.printing.enable = false;

  programs.nh = {
    enable = true;
    flake = "/home/edward/git/nix-dots"; # sets NH_OS_FLAKE variable for you
  };

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.extraUsers.edward = {
    shell = pkgs.zsh;
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 22 9090 443 ];
    allowedUDPPortRanges = [
      { from = 4000; to = 4007; }
      { from = 8000; to = 8010; }
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      hinfo = true;
      userServices = true;
      workstation = true;
    };
  };

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;  
  hardware.nvidia.modesetting.enable = true;

  #boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    config = {
      common.default = "gtk";
      niri.default = [ "gnome" "gtk" ];
    };
    xdgOpenUsePortal = false;
  };

  services.gnome.gnome-keyring.enable = true;
  services.gnome.gcr-ssh-agent.enable = false;

  # Use the regular SSH agent instead of gcr-ssh-agent
  programs.ssh.startAgent = true;

  # Enable PAM integration for gnome-keyring
  # This allows the keyring to be unlocked automatically at login
  security.pam.services.login.enableGnomeKeyring = true;
  security.pam.services.sddm.enableGnomeKeyring = true;


  services.flatpak.enable = true;

  services.xserver = {
    enable = true;
  };

  services.scx.enable = true;
  services.scx.scheduler = "scx_lavd"; # default is "scx_rustland"

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "25.11";
}
