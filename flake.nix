{
  description = "Java Web Application Environment";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem = { self', inputs', pkgs, ... }: {
        devShells.default = pkgs.mkShellNoCC {
          packages = with pkgs; [
            jdk21
            nodejs
            sqlite
          ];
        };
      };
    };
}
