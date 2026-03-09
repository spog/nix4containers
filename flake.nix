{
  description = "A flake to build containers";
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
      # This (now) breaks reproducibility:
      #created = "now";
      # Contents to include in the image root
      copyToRoot = pkgs.buildEnv {
        name = "image-root";
        paths = with pkgs; [
          bashInteractive
          hello
          chrpath
          coreutils
          cpio
          diffstat
          dockerTools.binSh
          dockerTools.usrBinEnv
          dockerTools.caCertificates
          dockerTools.fakeNss
          file
          findutils
          gawk
          gcc
          git
          gnumake
          gnused
          python3
          texinfo
          wget
          which
        ];
        pathsToLink = [ "/bin" "/etc" "/usr/bin" "/var" ];
      };

      config = {
        Cmd = [ "/bin/bash" ];
      };
    };
  };
}

