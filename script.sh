#!/bin/bash

if [[ -f ./project/package.json ]]; then
    cd project
    npm install
    npm run start:dev
else
    npm i -g @nestjs/cli
    nest new my-app --package-manager npm --language TS --strict

    cp -r my-app/. project/.
    rm -r my-app

    cd project

    chown -R node:node /project/dist
    chown -R node:node /project/nest-cli.json
    chown -R node:node /project/node_modules
    chown -R node:node /project/package.json
    chown -R node:node /project/package-lock.json
    chown -R node:node /project/src
    chown -R node:node /project/test
    chown -R node:node /project/tsconfig.build.json
    chown -R node:node /project/tsconfig.json
    chown -R node:node /project/.eslintrc.js
    chown -R node:node /project/.prettierrc
    chown -R node:node /project/.gitignore

    npm install
    npm run start:dev
fi
