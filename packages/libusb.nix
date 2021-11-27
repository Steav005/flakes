{ pkgs, ... }:
pkgs.stdenv.mkDerivation rec {
  name = "libusb";
  src = pkgs.fetchFromGitHub {
    owner = name;
    repo = name;
    rev = "d4452bd5554b2e6cc7017ad9cdba54a848cf5e93";
    sha256 = "sha256-vciHJxEOjcoYp2n2VWmVAEPkhikBx6IOQDl368TlBHw=";
  };
  buildInputs = with pkgs; [ libudev git ];
  nativeBuildInputs = with pkgs; [ autoreconfHook ];
}
