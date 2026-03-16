# packages.nix
{ pkgs }: with pkgs; [
          bashInteractive
          bzip2
          hello
          chrpath
          coreutils
          cpio
          diffstat
          diffutils
          #doas
          #doas-sudo-shim
          #doasConf
          dockerTools.binSh
          dockerTools.usrBinEnv
          dockerTools.caCertificates
          dockerTools.fakeNss
          file
          findutils
          gawk
          gcc
          git
          # Make glibc high priority so its zdump wins over tzdata's version:
          (lib.hiPrio glibc)
          (lib.hiPrio glibc.bin)
          glibc.dev
          glibcLocalesUtf8
          gnugrep
          gnulib
          gnumake
          gnused
          gnutar
          gzip
          hostname
          iproute2
          less
          libtinfo
          locale
          patch
          perl
          python3
          rpcsvc-proto
          strace
          #sudo
          texinfo
          tmux
          tzdata
          util-linux
          vim
          wget
          which
          xz
          zstd
]

