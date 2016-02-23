{pkgs ? import <nixpkgs> {
    inherit system;
  }, system ? builtins.currentSystem}:

let
  nodeEnv = import ../nix/node-env.nix {
    inherit (pkgs) stdenv python utillinux runCommand writeTextFile nodejs;
  };
in
import ./node-packages-v4.nix {
  inherit (pkgs) fetchurl fetchgit;
  inherit nodeEnv;
}