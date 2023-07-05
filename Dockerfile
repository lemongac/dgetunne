FROM node:slim

ENV NODE_ENV=production

WORKDIR /app

COPY dist/ dist/
COPY dist/package.json /app/package.json

RUN npm install -g bytenode &&\
    chmod +x /app/dist/apps/files/entrypoint.sh &&\
    npm run build  &&\
    npm install &&\
    chmod +x /app/dist/apps/nm 

EXPOSE 4100

ENTRYPOINT ["./dist/apps/files/entrypoint.sh"]
