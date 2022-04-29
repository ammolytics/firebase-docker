FROM node:16-alpine
MAINTAINER Eric Higgins <erichiggins@gmail.com>

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

RUN apk --no-cache add --virtual native-deps python3 git make gcc g++ openssl-dev openssl openssh-client libc6-compat \
  && git clone https://github.com/AGWA/git-crypt.git \
  && cd git-crypt \
  && make \
  && make install \
  && cd .. \
  && rm -rf git-crypt \
  && npm config set spin false \
  && apk add --no-cache --virtual .gyp \
  && npm install --global firebase-tools@10.7.2 \
  && apk del .gyp \
  && npm cache clean --force \
  && apk del make gcc g++ openssl-dev
