FROM python:3.7-slim-buster

COPY . /

VOLUME ["/app"]

WORKDIR /app

RUN \
    set -xe \
    && chmod +x /entrypoint.sh \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
      nodejs=10.24.0~dfsg-1~deb10u1 \
      ruby=1:2.5.1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    \
    && gem install prettier:2.0.0 \
    && python3 -m pip install --no-cache-dir --upgrade \
        pip==21.3.1 \
    && python3 -m pip install --no-cache-dir \
        tensorflow==2.5.0 \
        guesslang==2.2.1

VOLUME ["/src"]

WORKDIR /src

ENTRYPOINT ["/entrypoint.sh"]
