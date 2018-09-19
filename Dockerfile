FROM node:8-alpine
MAINTAINER Eric Higgins <erichiggins@gmail.com>

RUN apk --no-cache add --virtual native-deps python git make gcc g++ openssl-dev openssl openssh-client libc6-compat \
  && git clone https://github.com/AGWA/git-crypt.git \
  && cd git-crypt \
  && make \
  && make install \
  && cd .. \
  && rm -rf git-crypt \
  && yarn config set spin false \
  && yarn global add firebase-tools@4.1.2 phantomjs-prebuilt grpc node-pre-gyp node-gyp \
  && yarn cache clean \
  && apk del make gcc g++ openssl-dev
