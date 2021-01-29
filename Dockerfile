FROM node:14.15.4-alpine

RUN apk add --no-cache git
RUN npm config set unsafe-perm true

RUN mkdir /ghcli
WORKDIR /ghcli
RUN wget https://github.com/cli/cli/releases/download/v1.5.0/gh_1.5.0_linux_386.tar.gz -O ghcli.tar.gz
RUN tar --strip-components=1 -xf ghcli.tar.gz

WORKDIR /src
COPY package.json /src/package.json
COPY package-lock.json /src/package-lock.json
RUN npm ci --no-optional --color=false && npm cache clean --force
COPY . /src/


