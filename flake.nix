{
  description = "NixOS with Caelestia shell and Spicetify";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, caelestia-shell, spicetify-nix, zen-browser, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit system;
      };

      modules = [
        ./configuration.nix
        spicetify-nix.nixosModules.default

        ({ pkgs, ... }: {
          environment.systemPackages = with pkgs; [
            appimage-run
            caelestia-shell.packages.${system}.with-cli
            zen-browser.packages.${system}.default
          ];
        })
      ];
    };
  };
}
