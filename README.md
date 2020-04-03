![Gearbox](https://gearboxworks.github.io/assets/images/gearbox-logo.png)


# mailhog Docker container service for [Gearbox](https://github.com/gearboxworks/)
This is the repository for the [mailhog](https://github.com/mailhog/MailHog) Docker container implemented for [Gearbox](https://github.com/gearboxworks/).


## Repository Info
GitHub commit: ![commit-date](https://img.shields.io/github/last-commit/gearboxworks/docker-mailhog?style=flat-square)

GitHub release(latest): ![last-release-date](https://img.shields.io/github/release-date/gearboxworks/docker-mailhog) ![last-release-date](https://img.shields.io/github/v/tag/gearboxworks/docker-mailhog?sort=semver) [![release-state](https://github.com/gearboxworks/docker-mailhog/workflows/release/badge.svg?event=release)](https://github.com/gearboxworks/docker-mailhog/actions?query=workflow%3Arelease)


## Supported versions and respective Dockerfiles
| Service | GitHub Version | Docker Version | Docker Size | Docker Tags |
| ------- | -------------- | -------------- | ----------- | ----------- |
| [mailhog](https://github.com/mailhog/MailHog) | ![mailhog](https://img.shields.io/badge/mailhog-1.0.0-green.svg) | [![Docker Version)](https://img.shields.io/docker/v/gearboxworks/mailhog/1.0.0)](https://hub.docker.com/repository/docker/gearboxworks/mailhog) | [![Docker Size](https://img.shields.io/docker/image-size/gearboxworks/mailhog/1.0.0)](https://hub.docker.com/repository/docker/gearboxworks/mailhog) | _([`1.0.0`, `1.0`, `latest`](https://github.com/gearboxworks/docker-mailhog/blob/master/versions/1.0.0/DockerfileRuntime))_ |


## About this container.
A driving force behind [Gearbox](https://github.com/gearboxworks/) is to improve the user experience using software, and especially for software developers.

Our vision is to empower developers and other software users to quickly and easily use almost any version of a software service, command line tool or API without without first getting bogged down with installation and configuration.

In other words, our vision for [Gearbox](https://github.com/gearboxworks/) users is that software "**just works**".


## Using this container.
This container has been designed to work within the [Gearbox](https://github.com/gearboxworks/) framework.
However, due to the flexability of Gearbox, it can be used outside of this framework.

There are three methods:

## Method 1: Using gb-launch
`gb-launch` is a tool specifically designed to interact with a Gearbox Docker container.

It provides three important functional areas, without any Docker container learning curve:
- Allows control over Gearbox Docker containers: stop, start, create, remove.
- Build, update, modify and release Docker images.
- Acts as a proxy for interactive commands within a Gearbox Docker container.

It also provides a functional SSH daemon for connecting remotely as well as a standard set of common tools and utilities.


### Setup from GitHub repo
`gb-launch` is currently in beta testing and is included along with all Gearbox Docker repos.
Once out of beta, it will be included within the Gearbox installation package.

For now, simply clone this repository to your local machine.

`git clone https://github.com/gearboxworks/docker-mailhog.git`

### Running gb-launch
There are many ways to call gb-launch, either directly or indirectly.
Additionally, all host environment variables will be imported into the container seamlessly.
This allows a devloper to try multiple versions of software as though they were installed locally.

If a container is missing, it will be downloaded and created. Multiple versions can co-exist.

Create, and start the mailhog Gearbox container.

`./bin/gb-launch -gb-name mailhog`

Create, and start the mailhog Gearbox container. Run a shell.

`./bin/gb-launch -gb-name mailhog -gb-shell`

Create, and start the mailhog Gearbox container with version 1.0.0 and run a shell.

`./bin/gb-launch -gb-name mailhog -gb-version 1.0.0 -gb-shell`

If mailhog is symlinked to `gb-launch`, then you can drop the `-gb-name` flag.

`./bin/mailhog`

Running mailhog Gearbox container default command. If a container has a default interactive command, arguments can be supplied without specifying that command.

`./bin/mailhog -flag1 -flag2 variable`

`./bin/gb-launch -gb-name mailhog -gb-version 1.0.0 -flag1 -flag2 variable`


Running alternate commands within the mailhog Gearbox container.

`./bin/mailhog -gb-shell -- ls -l`

`./bin/gb-launch -gb-name mailhog -gb-version 1.0.0 -gb-shell -- ls -l`

`./bin/mailhog -gb-shell -- ps -eaf`

`./bin/gb-launch -gb-name mailhog -gb-version 1.0.0 -gb-shell -- ps -eaf`


ssh - All [Gearbox](https://github.com/gearboxworks/) containers have a running SSH daemon. So you can connect remotely.
To show what ports are exported to the host.

`./bin/gb-launch -gb-name mailhog -gb-list`


## Method 2: GitHub repo

### Setup from GitHub repo
Simply clone this repository to your local machine

`git clone https://github.com/gearboxworks/docker-mailhog.git`

### Building from GitHub repo
`make build` - Build Docker images. Build all versions from the base directory or specific versions from each directory.

`make list` - List already built Docker images. List all versions from the base directory or specific versions from each directory.

`make clean` - Remove already built Docker images. Remove all versions from the base directory or specific versions from each directory.

`make push` - Push already built Docker images to Docker Hub, (only for Gearbox admins). Push all versions from the base directory or specific versions from each directory.

### Runtime from GitHub repo
You can either build your container as above, or use it from DockerHub with these commands:

`make start` - Spin up a Docker container with the correct runtime configs.

`make stop` - Stop a Docker container.

`make run` - Run a Docker container in the foreground, (all STDOUT and STDERR will go to console). The Container be removed on termination.

`make shell` - Run a shell, (/bin/bash), within a Docker container.

`make rm` - Remove the Docker container.

`make test` - Will issue a `stop`, `rm`, `clean`, `build`, `create` and `start` on a Docker container.


## Method 3: Docker Hub

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

Either use `gb-launch` above or discover the port and SSH directly.


```
SSH_PORT="$(docker port mailhog-latest 22/tcp | sed 's/0.0.0.0://')"
ssh -p ${SSH_PORT} -o StrictHostKeyChecking=no gearbox@localhost
```

