{
  description = "Collection of my user flakes";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    libusb.url = "path:libusb";
    fcitx5-nord.url = "path:fcitx5-nord";
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachSystem [ "aarch64-linux" "i686-linux" "x86_64-linux" ]
    (system: {
      packages = {
        libusb = inputs.libusb.packages.${system}.libusb;
        fcitx5-nord = inputs.fcitx5-nord.packages.${system}.fcitx5-nord;
      };
    });
}
