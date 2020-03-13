![Gearbox](https://github.com/gearboxworks/gearbox.github.io/raw/master/Gearbox-100x.png)


# Another [Gearbox](https://github.com/gearboxworks/) Docker container service - mailhog
This is the repository for the [mailhog](https://github.com/mailhog/MailHog) Docker container implemented for [Gearbox](https://github.com/gearboxworks/).


## Repository Info
GitHub commit: ![commit-date](https://img.shields.io/github/last-commit/gearboxworks/docker-mailhog?style=flat-square)

GitHub release(latest): ![last-release-date](https://img.shields.io/github/release-date/gearboxworks/docker-mailhog) ![last-release-date](https://img.shields.io/github/v/tag/gearboxworks/docker-mailhog?sort=semver) [![release-state](https://github.com/gearboxworks/docker-mailhog/workflows/release/badge.svg?event=release)](https://github.com/gearboxworks/docker-mailhog/actions?query=workflow%3Arelease)


## Supported versions and respective Dockerfiles
| Service | GitHub Version | Docker Version | Docker Size | Docker Tags | Dockerfile |
| ------- | -------------- | -------------- | ----------- | ----------- | ---------- |
| [mailhog](https://github.com/mailhog/MailHog) | ![mailhog](https://img.shields.io/badge/mailhog-1.0.0-green.svg) | ![Docker Version)](https://img.shields.io/docker/v/gearboxworks/mailhog/1.0.0) | ![Docker Size](https://img.shields.io/docker/image-size/gearboxworks/mailhog/1.0.0) | `1.0.0`, `1.0`, `latest` | _([1.0.0/DockerfileRuntime](https://github.com/gearboxworks/docker-mailhog/blob/master/1.0/DockerfileRuntime))_ |



## Using this container.
This container has been designed to work within the [Gearbox](https://github.com/gearboxworks/)
framework.
However, due to the flexability of Gearbox, it can be used outside of this framework.
You can either use it directly from DockerHub or GitHub.


## Method 1: GitHub repo

### Setup from GitHub repo
Simply clone this repository to your local machine

`git clone https://github.com/gearboxworks/mailhog-docker.git`

### Building from GitHub repo
`make build` - Build Docker images. Build all versions from the base directory or specific versions from each directory.

`make list` - List already built Docker images. List all versions from the base directory or specific versions from each directory.

`make clean` - Remove already built Docker images. Remove all versions from the base directory or specific versions from each directory.

`make push` - Push already built Docker images to Docker Hub, (only for Gearbox admins). Push all versions from the base directory or specific versions from each directory.

### Runtime from GitHub repo
When you `cd` into a version directory you can also perform a few more actions.

`make start` - Spin up a Docker container with the correct runtime configs.

`make stop` - Stop a Docker container.

`make run` - Run a Docker container in the foreground, (all STDOUT and STDERR will go to console). The Container be removed on termination.

`make shell` - Run a shell, (/bin/bash), within a Docker container.

`make rm` - Remove the Docker container.

`make test` - Will issue a `stop`, `rm`, `clean`, `build`, `create` and `start` on a Docker container.


## Method 2: Docker Hub

### Setup from Docker Hub
A simple `docker pull gearbox/mailhog` will pull down the latest version.

### Starting
start - Spin up a Docker container with the correct runtime configs.

`docker run -d --name mailhog-latest --restart unless-stopped --network gearboxnet gearbox/mailhog:latest`

### Stopping
stop - Stop a Docker container.

`docker stop mailhog-latest`

### Remove container
rm - Remove the Docker container.

`docker container rm mailhog-latest`

### Run in foreground
run - Run a Docker container in the foreground, (all STDOUT and STDERR will go to console). The Container be removed on termination.

`docker run --rm --name mailhog-latest --network gearboxnet gearbox/mailhog:latest`

### Run a shell
shell - Run a shell, (/bin/bash), within a Docker container.

`docker run --rm --name mailhog-latest -i -t --network gearboxnet gearbox/mailhog:latest /bin/bash`

### SSH
ssh - All [Gearbox](https://github.com/gearboxworks/) containers have a running SSH daemon. So you can connect remotely.

```
SSH_PORT="$(docker port mailhog-latest 22/tcp | sed 's/0.0.0.0://')"
ssh -p ${SSH_PORT} -o StrictHostKeyChecking=no gearbox@localhost
```

