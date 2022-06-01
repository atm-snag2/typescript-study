## How to make this repo

```
$ cat <<EOF > Dockerfile
FROM node:14-bullseye-slim

WORKDIR /usr/src/app

COPY package.json yarn.lock ./
RUN yarn install
EOF
$ cat <<EOF > docker-compose.yml
version: '3'
services:
  app:
    build: .
    working_dir: /usr/src/app
    volumes:
      - .:/usr/src/app
EOF
$ cat <<EOF > .gitignore
/node_modules
EOF
$ cat <<EOF > .dockerignore
*

!/package.json
!/yarn.lock
EOF
$ cat <<EOF > .eslintrc.js
module.exports = {
  env: {
    browser: true,
    es2021: true,
    node: true,
    "jest/globals": true
  },
  extends: [
    'standard',
    'prettier'
  ],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    ecmaVersion: 'latest',
    sourceType: 'module'
  },
  plugins: [
    '@typescript-eslint',
    "jest"
  ],
  rules: {
  }
}
EOF
$ docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app node:14-bullseye-slim yarn init -y
$ docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app node:14-bullseye-slim yarn add -D jest typescript ts-jest @types/jest ts-node
$ docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app node:14-bullseye-slim yarn add -D eslint prettier eslint-config-prettier eslint-plugin-jest
$ docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app node:14-bullseye-slim yarn tsc --init
```
