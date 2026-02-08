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
      obsidianssh = "(cloudflared access tcp --hostname ssh.obsidianos.xyz --listener 127.0.0.1:2222 & PID=$!; sleep 1; ssh -p 2222 localhost; kill $PID)";
      obsidiansftp = "(cloudflared access tcp --hostname ssh.obsidianos.xyz --listener 127.0.0.1:2222 & PID=$!; sleep 1; sftp -p 2222 localhost; kill $PID)";
      obsidianirc = "(cloudflared access tcp --hostname irc.obsidianos.xyz --listener 127.0.0.1:6667 & PID=$!; sleep 1; konversation --server localhost --port 6667; kill $PID)";
    };
    histSize = 10000;
    histFile = "$HOME/.zsh_history";
    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];
  };
}
