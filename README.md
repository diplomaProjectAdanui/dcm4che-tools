# dcm4che-tools

Supported architecture: `linux/amd64`, `linux/arm64`, `linux/arm/v7`, `linux/riscv64`

Base image: `ubuntu:22.04`

## Run

```sh
$ docker run -it --rm ghcr.io/diplomaprojectadanui/dcm4che-tools:latest
```

## Build local

1. Clone the repo
```sh
$ git clone https://github.com/diplomaProjectAdanui/dcm4che-tools.git
$ cd dcm4che-tools
```
2. Build the image
```sh
$ docker build -t dcm4che-tools:latest .
```
3. Start the image
```sh
$ docker run -it --rm dcm4che-tools:latest
```

## Extend Dockerfile

```Dockerfile
FROM ghcr.io/diplomaprojectadanui/dcm4che-tools:latest
```

## Extra

Tool source code: [dcm4che](https://github.com/dcm4che/dcm4che)

License: [MOZILLA PUBLIC LICENSE v1.1](LICENSE)
