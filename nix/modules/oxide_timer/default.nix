{
  lib,
  rustPlatform, 
}:

rustPlatform.buildRustPackage rec {
  pname = "oxide_timer";
  version = "0.1.0";

  cargoLock = {
    lockFile = ./Cargo.lock;
    allowBuiltinFetchGit = true;
  };

  cargoSha256 = "17ldqr3asrdcsh4l29m3b5r37r5d0b3npq1lrgjmxb6vlx6a36qh";

  meta = {
    description = "A timer daemon and client, built to work well with eww.";
    license = lib.licenses.unlicense;
    maintainers = [ ];
  };
}
