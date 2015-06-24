FROM alpine
ENTRYPOINT ["consul-template","-once"]

RUN   apk add --update curl
ENV   CONSULTEMPLATE_VERSION 0.10.0
ENV   CONSULTEMPLATE_MD5 05c97fbf926f5db73ffbfc81ecf19daa
RUN   curl -LO https://github.com/hashicorp/consul-template/releases/download/v${CONSULTEMPLATE_VERSION}/consul-template_${CONSULTEMPLATE_VERSION}_linux_386.tar.gz && \
      echo "${CONSULTEMPLATE_MD5}  consul-template_${CONSULTEMPLATE_VERSION}_linux_386.tar.gz" | md5sum -c && \
      tar -xvzf consul-template_${CONSULTEMPLATE_VERSION}_linux_386.tar.gz && \
      mv consul-template_${CONSULTEMPLATE_VERSION}_linux_386/consul-template /usr/local/bin/
