FROM node:14-bullseye-slim

WORKDIR /usr/src/app

COPY package.json yarn.lock ./
RUN yarn install
