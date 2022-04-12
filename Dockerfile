FROM hashicorp/terraform:light

RUN apk update && apk add bash py-pip curl

RUN curl -s https://fluxcd.io/install.sh | sudo bash

RUN apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev make && \
    pip --no-cache-dir install -U pip && \
    pip --no-cache-dir install azure-cli && \
    apk del --purge build
