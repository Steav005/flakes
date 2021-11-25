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
          libusb = pkgs.stdenv.mkDerivation rec {
            name = "libusb";
            src = pkgs.fetchFromGitHub {
              owner = name;
              repo = name;
              rev = "d4452bd5554b2e6cc7017ad9cdba54a848cf5e93";
              sha256 = "sha256-vciHJxEOjcoYp2n2VWmVAEPkhikBx6IOQDl368TlBHw=";
            };
            buildInputs = with pkgs; [ libudev git ];
            nativeBuildInputs = with pkgs; [ autoreconfHook ];
          };
          fcitx5-nord = pkgs.stdenv.mkDerivation rec {
            name = "fcitx5-nord";
            version = "bdaa8fb";
            src = pkgs.fetchFromGitHub {
              owner = "tonyfettes";
              repo = name;
              rev = "${version}723b8d0b22f237c9a60195c5f9c9d74d1";
              sha256 = "sha256-qVo/0ivZ5gfUP17G29CAW0MrRFUO0KN1ADl1I/rvchE=";
            };
            unpackPhase = "mkdir $out";
            installPhase = "cd ${src} && cp -r * $out";
          };
          bibata = pkgs.stdenv.mkDerivation rec {
            name = "bibata";
            version = "1.1.2";
            src = pkgs.fetchurl {
              url =
                "https://github.com/ful1e5/Bibata_Cursor/releases/download/v${version}/Bibata.tar.gz";
              sha256 = "sha256-b2c2paSBmNZ1DNV4Jk2ROz8VR4lL/CXbyFPg+TS5G7w=";
            };
            phases = [ "installPhase" ];
            installPhase = ''
              mkdir -p $out/share/icons
              tar xvf $src -C $out/share/icons/
            '';
          };
        };
      });
}
