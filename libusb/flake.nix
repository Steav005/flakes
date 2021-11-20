{
  description = "Libusb 1.0.25-pre";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachSystem [ "aarch64-linux" "i686-linux" "x86_64-linux" ] (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        packages = flake-utils.lib.flattenTree {
          libusb = pkgs.stdenv.mkDerivation rec {
            name = "libusb";
            version = "pre-1.0.25-20211109";
            src = pkgs.fetchFromGitHub {
              owner = name;
              repo = name;
              rev = "683e3cf21ed37d4492c20cea8de810c4d95ae8b6";
              sha256 = "sha256-/DKnx9Ptmx4K+ySBLrHfEyQy9BOisB+fhSxftDxArkY=";
            };
            buildInputs = with pkgs; [ libudev ];
            nativeBuildInputs = with pkgs; [ autoreconfHook ];
          };
        };
        defaultPackage = packages.libusb;
      });
}
