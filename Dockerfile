FROM node:10

RUN npm install -g sonos-web-cli
USER node
RUN sonos-web install

EXPOSE 5050

HEALTHCHECK --interval=1m --timeout=2s \
  CMD curl -LSs http://localhost:5050 || exit 1

WORKDIR /home/node/.sonos-web
CMD ["node","src/server.js"]
