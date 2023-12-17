FROM v2fly/v2fly-core:v4.27.0

RUN apk add nginx
COPY ./nginx/default.conf /etc/nginx/
COPY ./v2ray/v2ray.json /etc/v2ray/
RUN mkdir -p /run/nginx

COPY run.sh /run.sh
RUN chmod 744 /run.sh

EXPOSE 80
ENTRYPOINT "/run.sh"
