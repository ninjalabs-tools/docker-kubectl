FROM alpine:latest as downloader

RUN apk add curl
RUN curl -LO https://dl.k8s.io/release/v1.21.0/bin/linux/amd64/kubectl
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

FROM alpine:latest
COPY --from=downloader /usr/local/bin/kubectl /usr/local/bin/kubectl
