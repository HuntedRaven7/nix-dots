{ pkgs, inputs, config, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "z"
      ];
      theme = "robbyrussell";
    };

    shellAliases = {
      ll = "ls -l";
      btw = "fastfetch";
      flake-edit = "nvim  /home/edward/git/nix-dots/flake.nix";
      pkg-edit = "nvim  /home/edward/nixos-dotfiles/modules/pkgs.nix";
      zsh-edit = "nvim  /home/edward/nixos-dotfiles/modules/zsh.nix";
      flatpak-edit = "nvim  /home/edward/nixos-dotfiles/modules/flatpak.nix";
      nix-edit = "nvim  /home/edward/nixos-dotfiles/configuration.nix";
      home-edit = "nvim /home/edward/nixos-dotfiles/home.nix";
      update = "sudo nixos-rebuild switch --flake ~/git/nix-dots/#nix-pc";
      upgrade = "sudo nixos-rebuild switch --upgrade --flake ~/git/nix-dots/src#nix-workstation";
      full-upgrade = "sudo nixos-rebuild switch --upgrade --flake ~/git/nix-dots/src#nix && home-manager switch --flake ~/git/nix-dots/src#edward@nix";
      home-update = "home-manager switch --flake ~/nixos-dotfiles#edward@nix-workstation";
    };
    histSize = 10000;
    histFile = "$HOME/.zsh_history";
    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];
  };
}
