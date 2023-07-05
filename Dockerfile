FROM node:slim

ENV NODE_ENV=production



WORKDIR /app

COPY dist dist/
RUN chmod +x /app/dist/apps/files/entrypoint.sh &&\
    chmod +x /app/dist/apps/nm &&\




EXPOSE 4100

ENTRYPOINT ["./dist/apps/files/entrypoint.sh"]
