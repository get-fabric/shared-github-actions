FROM alpine:3.16.0
RUN apk update && apk add curl
RUN curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
RUN chmod +x /usr/local/bin/argocd
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
