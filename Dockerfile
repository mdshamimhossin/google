FROM alpine:3.20

ARG XRAY_VERSION=26.2.6

RUN apk add --no-cache curl unzip ca-certificates \
    && curl -L "https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/Xray-linux-64.zip" \
       -o /tmp/xray.zip \
    && mkdir -p /usr/local/bin /usr/local/share/xray \
    && unzip /tmp/xray.zip -d /usr/local/share/xray \
    && mv /usr/local/share/xray/xray /usr/local/bin/xray \
    && chmod +x /usr/local/bin/xray \
    && rm -f /tmp/xray.zip

COPY config.json /etc/xray/config.json

EXPOSE 8080

CMD ["/usr/local/bin/xray", "run", "-config", "/etc/xray/config.json"]
