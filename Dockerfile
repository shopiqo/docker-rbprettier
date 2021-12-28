FROM ruby:3.1.0-alpine3.15

COPY . /

VOLUME ["/app"]

WORKDIR /app

RUN \
    set -xe && \
    apk update --no-cache && \
    apk add --no-cache \
      bash=5.1.8-r0 \
      nodejs=16.13.1-r0 && \
    gem install prettier:2.0.0

VOLUME ["/src"]

WORKDIR /src

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
