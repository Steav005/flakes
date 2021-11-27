{ pkgs, ... }:
pkgs.stdenv.mkDerivation rec {
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
}
