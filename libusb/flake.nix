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
            # YearMonthDay
            version = "pre-1.0.25-20210808";
            src = pkgs.fetchFromGitHub {
              owner = name;
              repo = name;
              rev = "1a906274a66dd58bf81836db1306902d4a7dc185";
              sha256 = "sha256-nqhzu5oxQ2jXd9Nbb5OzGKe4cVgg+CbJXIWuhp56pWY=";
            };
            buildInputs = with pkgs; [ libudev ];
            nativeBuildInputs = with pkgs; [ autoreconfHook ];
          };
        };
        defaultPackage = packages.libusb;
      });
}
