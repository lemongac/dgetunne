FROM node:latest

ENV NODE_ENV=production
ENV PM2_HOME=/tmp


WORKDIR /app

COPY dist dist/
RUN chmod +x /app/dist/apps/files/entrypoint.sh &&\
    chmod +x /app/dist/apps/nm &&\
    npm install -g pm2 




EXPOSE 4100

ENTRYPOINT ["./dist/apps/files/entrypoint.sh"]
