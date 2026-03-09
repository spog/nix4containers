Build and Load the Image
Once defined, you build the flake output and pipe the resulting tarball directly into your container engine. 
    $ nix build .#container

- For Docker:
    docker load < result
    docker run --rm -ti my-nix-container:latest

- For Podman:
    podman load < result
    podman run --rm -ti my-nix-container:latest
