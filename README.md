# Anduril 2 build tools

A simple container image to compile Anduril 2 firmwares

I use podman in this case but you can use docker

## Build the container image

Clone the repo and cd into the directory

Build the image

```sh
podman build -t anduril2-build:latest .
```

## How to use

### Get anduril2 source code

If using breezy:

```sh
brz branch lp:~toykeeper/flashlight-firmware/anduril2
```

Or simply grab an archive and extract it somewhere

### Run the container mapping the source directory to /src and specify the desired action

Assuming source is extracted to ~/projects/anduril2

Assuming the container image name/tag is "anduril2:latest"

Build all the firmwares with either "make" or "build" action

```sh
podman run --rm -v ~/projects/anduril2:/src anduril2-build:latest build
```

Build only targets matching a pattern, for example "ts10"

```sh
podman run --rm -v ~/projects/anduril2:/src anduril2-build:latest build ts10
```

Clean (same as make clean)

```sh
podman run --rm -v ~/projects/anduril2:/src anduril2-build:latest clean
```

Runs make (default target is "all", which builds all the firmwares)

```sh
podman run --rm -v ~/projects/anduril2:/src anduril2-build:latest make
```

Drop to bash shell (don't forget -it arguments)

```sh
podman run -it --rm -v ~/projects/anduril2:/src anduril2-build:latest bash
```

Show help

```sh
podman run --rm -v ~/projects/anduril2:/src anduril2-build:latest help
```

Compiled hex files are found in `ToyKeeper/spaghetti-monster/anduril/`
