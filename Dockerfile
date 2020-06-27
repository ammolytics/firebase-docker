FROM node:12-alpine
MAINTAINER Eric Higgins <erichiggins@gmail.com>

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

RUN apk --no-cache add --virtual native-deps python git make gcc g++ openssl-dev openssl openssh-client libc6-compat \
  && git clone https://github.com/AGWA/git-crypt.git \
  && cd git-crypt \
  && make \
  && make install \
  && cd .. \
  && rm -rf git-crypt \
  && npm config set spin false \
  && apk add --no-cache --virtual .gyp \
  && npm install --global firebase-tools@8.4.3 \
  && apk del .gyp \
  && npm cache clean --force \
  && apk del make gcc g++ openssl-dev
