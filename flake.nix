{
  description = "Collection of my user flakes";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    libusb.url = "path:./libusb";
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      {
        packages = {
          libusb = inputs.libusb.packages.${system}.libusb;
        };
      });
}
