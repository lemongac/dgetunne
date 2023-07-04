FROM node:slim

ENV NODE_ENV=production


WORKDIR /app

COPY dist dist/

EXPOSE 4100

CMD [ "node", "./dist/apps/node-vless/main.js" ]
