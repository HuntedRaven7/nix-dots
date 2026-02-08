{
  description = "The Nix Files";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Anime Game Launcher
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs"; 

    # OXWM
    # oxwm.url = "github:tonybanters/oxwm";
    # oxwm.inputs.nixpkgs.follows = "nixpkgs";
    
    # Nix Flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-flatpak,
    aagl,
    ...
  } @ inputs: let
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      # FIXME replace with your hostname
      nix-pc = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        # > Our main nixos configuration file <
        modules = [
        nix-flatpak.nixosModules.nix-flatpak
	./src/configuration.nix
        {
          imports = [ aagl.nixosModules.default ];
          nix.settings = aagl.nixConfig; # Set up Cachix
          programs.anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
          programs.anime-games-launcher.enable = true;
          programs.honkers-railway-launcher.enable = true;
          programs.sleepy-launcher.enable = true;
         }
	];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      # FIXME replace with your username@hostname
      "nix-pc@edward" = home-manager.lib.homeManagerConfiguration {
        # Home-manager requires 'pkgs' instance
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # FIXME replace x86_64-linux with your architecure 
        extraSpecialArgs = {inherit inputs;};
        # > Our main home-manager configuration file <
        modules = [
	./src/home.nix
	];
      };
    };
  };
}
