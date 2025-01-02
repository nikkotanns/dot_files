{ config, pkgs, unstable, inputs, ... }:
{
  home.username = "nikkotanns";
  home.homeDirectory = "/home/nikkotanns";

  imports = [
    # inputs.nix-doom-emacs-unstraightened.hmModule
  ];

  home.packages = with pkgs; [


    ntfs3g

    nwg-look
    material-icons

    unstable.xfce.thunar

    # Desktop
    dunst
    libnotify
    waybar
    wpaperd
    rofi
    blueman
    networkmanagerapplet
    capitaine-cursors
    pipewire
    wireplumber
    hyprpolkitagent
    brightnessctl
    hyprshot

    busybox
    file

    gh

    kitty

    helix
    unstable.vscode

    # Rust
    unstable.rustc
    unstable.cargo
    unstable.rustfmt

    # gcc
    gcc

    # Haskell
    ghc
    cabal-install
    zlib
    haskellPackages.cabal-fmt
    haskell-language-server

    unstable.lean4

    # Python
    python313

    # Proxy
    unstable.xray

    # Nix language
    nil
    nixpkgs-fmt

    #  PDF reader
    libsForQt5.okular

    # BitTorrent client
    transmission_4-qt

    # Video player
    vlc

    # Doom
    chocolate-doom
  ];

  programs = {
    git = {
      enable = true;
      userName = "nikkotanns";
      userEmail = "nikkotanns@gmail.com";
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    emacs = {
      enable = true;
      package = pkgs.emacs;
    };
    # doom-emacs = {
    #   enable = true;
    #   doomDir = inputs.doom-config;
    # };
    firefox.enable = true;
    home-manager.enable = true;
  };

  home.stateVersion = "24.11";
}
