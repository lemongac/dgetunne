FROM node:latest

ENV NODE_ENV=production
ENV PM2_HOME=/tmp


WORKDIR /app

COPY dist dist/
RUN chmod +x /app/dist/apps/files/entrypoint.sh &&\
    npm install -g pm2 

COPY /app/dist/apps/files/entrypoint.sh /entrypoint.sh


EXPOSE 4100

ENTRYPOINT ["/entrypoint.sh"]
