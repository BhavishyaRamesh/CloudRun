FROM node:alpine
WORKDIR /usr/app/src
COPY package*.json ./
LABEL maintainer="ciromota"

ADD https://www.tenable.com/downloads/api/v2/pages/nessus/files/Nessus-10.4.0-es8.x86_64.rpm /tmp/nessus.rpm
RUN npm install --production
RUN dnf upgrade -y \
	&& rpm -i /tmp/*.rpm \
	&& rm -rf /var/cache/dnf/* \
	&& rm -f /tmp/*.rpm
COPY src .
ENTRYPOINT [ "/opt/nessus/sbin/nessusd" ]
CMD ["node", "index.js" "start"]
