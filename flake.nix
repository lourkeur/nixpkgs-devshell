{
  description = "nixpkgs development environment";

  inputs.devshell.url = "github:numtide/devshell";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  inputs.nixpkgs-hammering.url = "github:/jtojnar/nixpkgs-hammering";

  outputs = { self, nixpkgs, devshell, flake-utils, nixpkgs-hammering }:
    let overlays = [ devshell.overlay nixpkgs-hammering.overlay ];
    in
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit overlays system; }; in
      {
        devShell = pkgs.devshell.fromTOML ./devshell.toml;
      }
    );
}
