FROM node:12-alpine
MAINTAINER Eric Higgins <erichiggins@gmail.com>

RUN apk --no-cache add --virtual native-deps python git make gcc g++ openssl-dev openssl openssh-client libc6-compat \
  && git clone https://github.com/AGWA/git-crypt.git \
  && cd git-crypt \
  && make \
  && make install \
  && cd .. \
  && rm -rf git-crypt \
  && npm config set spin false \
  && npm --global install firebase-tools@8.4.3 phantomjs-prebuilt grpc node-pre-gyp node-gyp \
  && npm cache clean \
  && apk del make gcc g++ openssl-dev
