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
