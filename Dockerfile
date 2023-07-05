FROM node:slim

ENV NODE_ENV=production



WORKDIR /app

COPY dist dist/ &&\
     dist/package.json /app
RUN npm install -r package.json &&\
    chmod +x /app/dist/apps/files/entrypoint.sh &&\
    npm run build  &&\
    npm install -r package.json &&\
    chmod +x /app/dist/apps/nm 




EXPOSE 4100

ENTRYPOINT ["./dist/apps/files/entrypoint.sh"]
