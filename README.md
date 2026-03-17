Build, load and run the Image

Build the flake output and pipe the resulting tarball directly into your container engine:

    $ nix build .#container

- For Docker:
    $ docker load < result
    $ docker run --rm -ti my-nix-container:latest

- For Podman:
    $ podman load < result
    $ podman run --rm -ti my-nix-container:latest

Run examples:
    $ docker run --rm -ti -v $(pwd):/workdir --workdir=/workdir my-nix-container:latest
    $ docker run --rm -ti -u $(id -u):$(id -g) -v $(pwd):/workdir:rw --workdir=/workdir my-nix-container:latest
    $ docker run --rm -ti -u $(id -u):$(id -g) -v $(pwd):/workdir:rw -v /tmp:/tmp:rw --workdir=/workdir my-nix-container:latest

    Use current dir as workdir:
    $ docker run --rm -ti -u $(id -u):$(id -g) -v $(pwd):$(pwd):rw -v /tmp:/tmp:rw --workdir=$(pwd) my-nix-container:latest
    $ docker run --rm -ti -u $(id -u):$(id -g) -v $(pwd):$(pwd):rw -v /tmp:/tmp:rw -v /var/tmp:/var/tmp:rw --workdir=$(pwd) my-nix-container:latest
    $ docker run --rm -ti -u $(id -u):$(id -g) -v $(pwd):$(pwd):rw -v /tmp:/tmp:rw -v /var/tmp:/var/tmp:rw -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro --cap-add=NET_ADMIN --device /dev/net/tun:/dev/net/tun --net=host --workdir=$(pwd) my-nix-container:latest


Which builder variant should you use?

    Use buildEnv + Docker: Best for containers. When you copyToRoot in a Docker image, the image is the chroot, and the paths are fixed during the build.
    Use buildEnv + chroot: Best if you are building a custom filesystem for an embedded device or a VM.
    Use buildFHSEnv: Best for local development where you need a "fake" /bin or /usr/lib without messing with sudo mount commands.
