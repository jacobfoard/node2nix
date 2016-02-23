{pkgs ? import <nixpkgs> {
    inherit system;
  }, system ? builtins.currentSystem}:

let
  nodeEnv = import ../nix/node-env.nix {
    inherit (pkgs) stdenv python utillinux runCommand writeTextFile;
    nodejs = pkgs."nodejs-5_x";
  };
in
import ./node-packages-v5.nix {
  inherit (pkgs) fetchurl fetchgit;
  inherit nodeEnv;
}