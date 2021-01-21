FROM node:14.15.4-alpine

RUN apk add --no-cache git
RUN npm config set unsafe-perm true

WORKDIR /src
COPY package.json /src/package.json
COPY package-lock.json /src/package-lock.json

RUN npm ci --no-optional --color=false && npm cache clean --force
COPY . /src/
RUN git log -1
