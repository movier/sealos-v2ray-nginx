docker build -t sealos-v2ray-nginx .
docker run -it --rm -p 80:80 -e V2RAY_TOKEN=0fff0e7a-9be1-11ee-8c90-0242ac120002 -e V2RAY_WS_PATH=/ray sealos-v2ray-nginx