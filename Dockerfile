FROM alpine
RUN apk add --update --no-cache  openssh sshpass bash lftp
ENV PLUGIN_USERNAME ''
ENV PLUGIN_PASSWORD ''
ENV PLUGIN_HOST ''
ENV PLUGIN_TARGET ''
ENV PLUGIN_SOURCE ''
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod 700 /entrypoint.sh
ENTRYPOINT /entrypoint.sh
