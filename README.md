# Prettier for Ruby inside Docker

## Quickstart

### Standalone

```bash
docker run --rm -v $(pwd):/src ghcr.io/efsa-io/rbprettier:v1.0.0
```

### pre-commit-config.yaml

```yaml
[…]
repos:
    - repo: local
      hooks:
          - id: rbprettier
            name: rbprettier
            language: docker_image
            entry: ghcr.io/efsa-io/rbprettier:v1.0.0
            types: [file]
[…]
```

## Contribute

### pre-commit

```bash
pre-commit install
```

### local testing

```bash
docker build --no-cache -t rbprettier .
echo "#\!/usr/bin/env ruby\nputs \"Hello world!\"" > hello.rb
docker run --rm -v $(pwd):/src rbprettier
```
