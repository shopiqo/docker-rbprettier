# [Prettier](https://github.com/prettier/plugin-ruby) for Ruby inside Docker

Docker images to auto-format Ruby source code (e.g. `Vagrantfile`). Most available solutions out there aren't able to determine correct programming language unless you are using file extensions like `*.rb`. That's why we are using [Guesslang](https://guesslang.readthedocs.io/en/latest/) to detect Ruby source code with more than 90% accuracy.

## Quickstart

### Standalone

```bash
docker run --rm -v $(pwd):/src ghcr.io/efsa-io/rbprettier:v1.0.1
```

### pre-commit (recommended)

Here is an example for your `pre-commit-config.yaml`:

```yaml
[…]
repos:
    - repo: local
      hooks:
          - id: rbprettier
            name: rbprettier
            language: docker_image
            entry: ghcr.io/efsa-io/rbprettier:v1.0.1
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
mkdir tests
echo 'puts "Hello world!"' > tests/hello.rb
docker run --rm -v $(pwd):/src rbprettier
```
