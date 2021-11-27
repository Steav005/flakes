{
  description = "Collection of my user flakes";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-21.05";
    #libusb.url = "./libusb";
    #fcitx5-nord.url = "git+filefcitx5-nord";
  };

  outputs = { self, flake-utils, nixpkgs-stable, ... }@inputs:
    flake-utils.lib.eachSystem [ "aarch64-linux" "i686-linux" "x86_64-linux" ]
    (system:
      let pkgs = nixpkgs-stable.legacyPackages.${system};
      in rec {
        packages = {
          libusb = import ./packages/libusb.nix { inherit pkgs; };
          fcitx5-nord = import ./packages/fcitx5-nord.nix { inherit pkgs; };
          bibata = import ./packages/bibata.nix { inherit pkgs; };
        };
      });
}
