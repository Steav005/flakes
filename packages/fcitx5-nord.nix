{ pkgs, ... }:
pkgs.stdenv.mkDerivation rec {
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
}
