FROM node:latest

MAINTAINER bob@grip.qa

ENV PORT 1337
EXPOSE 1337

RUN apt-get update -y && apt-get install -y \
    python2.7 python-pip \
    libfreetype6 libfontconfig

RUN mkdir /data

ADD ./package.json /data/package.json
RUN cd /data && npm install

ADD . /data/

ENTRYPOINT ["node"]

CMD ["/data/server.js"]
