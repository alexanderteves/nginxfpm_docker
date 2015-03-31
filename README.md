# nginxfpm_docker

Simple Dockerfile to build an image that runs `nginx` on port 80 with `php5-fpm` for quick PHP hacking.

## Usage

Use `./build` to build the image and `./run` for a simple container that binds port the container's port 80 to the host and has `www` in the working directory as its `/var/www`.
