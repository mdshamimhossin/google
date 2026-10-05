FROM ghcr.io/xtls/xray-core:26.9.9

COPY config.json /usr/local/etc/xray/config.json

EXPOSE 8080

CMD ["run", "-config", "/usr/local/etc/xray/config.json"]
