# Prettier for Ruby inside Docker

## Usage

```shell
docker build -t rbprettier .
docker run --rm -v $(pwd):/src rbprettier
```

## Contribute

### pre-commit

```shell
pre-commit install
```
