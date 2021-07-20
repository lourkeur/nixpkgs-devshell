{ pkgs ? import <nixpkgs> }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    git-aggregator
    nixpkgs-review
    nixpkgs-hammering
  ];
}
