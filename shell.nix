{ pkgs ? import <nixpkgs> }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nixpkgs-review
    nixpkgs-hammering
  ];
}
