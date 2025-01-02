{
  description = "NixOS configuration";

  inputs = {
    ###     NIXPKGS     ###
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixos-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    ###   HOME MANAGER  ###
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ###    DOOM EMACS   ###
    # nix-doom-emacs-unstraightened.url = "github:marienz/nix-doom-emacs-unstraightened";
    # doom-config = {
    #   url = "file:///home/nikkotanns/.config/doom-emacs";
    #   flake = false;
    # };
  };

  outputs = inputs @ { nixpkgs, home-manager, ... }: rec {
    args = {
      config = { };
      inputs = inputs;
      pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
      unstable = import inputs.nixos-unstable { system = "x86_64-linux"; config.allowUnfree = true; };
    };
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; pkgs = args.pkgs; unstable = args.unstable; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nikkotanns = import ./home.nix args;
        }
      ];
    };
  };
}
