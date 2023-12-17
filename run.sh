#!/bin/sh

if [ -z "${V2RAY_TOKEN}" ]; then
    echo "env V2RAY_TOKEN not set!"
    exit 1
fi

if [ -z "${V2RAY_WS_PATH}" ]; then
    echo "env V2RAY_WS_PATH not set!"
    exit 1
fi

echo "V2RAY TOKEN          : ${V2RAY_TOKEN}"
echo "V2RAY WS PATH        : ${V2RAY_WS_PATH}"

V2RAY_CONF="/etc/v2ray/config.json"

start_v2ray() {
    sed \
        -e "s:\${V2RAY_TOKEN}:${V2RAY_TOKEN}:" \
        -e "s:\${V2RAY_WS_PATH}:${V2RAY_WS_PATH}:" \
        /etc/v2ray/v2ray.json >${V2RAY_CONF}
    v2ray -config ${V2RAY_CONF}
}

start_nginx() {
    sed \
        -e "s:\${V2RAY_WS_PATH}:${V2RAY_WS_PATH}:" \
        /etc/nginx/default.conf > /etc/nginx/conf.d/default.conf
    nginx && echo "nginx started"
}

main() {
    start_nginx
    start_v2ray
}

main
