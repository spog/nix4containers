{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux"; # Containers must be built for Linux
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.container = pkgs.dockerTools.buildImage {
      name = "my-nix-container";
      tag = "latest";
      # Contents to include in the image root
      copyToRoot = pkgs.buildEnv {
        name = "image-root";
        paths = [ pkgs.hello pkgs.bashInteractive ];
        pathsToLink = [ "/bin" ];
      };
      config = {
        Cmd = [ "${pkgs.hello}/bin/hello" ];
      };
    };
  };
}

