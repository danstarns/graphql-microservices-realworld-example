FROM node:12

WORKDIR /app

RUN npm i cross-env -g

COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json

RUN npm i --production

COPY ./src/index.js ./src/index.js
COPY ./src/graphql/locals/ ./src/graphql/locals/
COPY ./src/mongodb.js ./src/mongodb.js
COPY ./src/config.js ./src/config.js
COPY ./src/debug.js ./src/debug.js
COPY ./.env ./.env

EXPOSE 3000

CMD ["npm", "start"]