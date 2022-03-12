{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils, ... }:
        flake-utils.lib.eachDefaultSystem (system:
            let
                pkgs = import nixpkgs { inherit system; };
            in rec {
                devShell = pkgs.mkShell {
                    buildInputs = with pkgs; [
                        xorg.libX11
                        xorg.libXcursor
                        xorg.libXrandr
                        xorg.libXi
                    ];
                    nativeBuildInputs = with pkgs; [
                        clang_12
                        pkg-config
                    ];
                };
            });
}
