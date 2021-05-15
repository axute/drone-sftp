FROM alpine
RUN apk add --update --no-cache  openssh sshpass bash lftp moreutils
ENV PLUGIN_USERNAME ''
ENV PLUGIN_PASSWORD ''
ENV PLUGIN_HOST ''
ENV PLUGIN_TARGET ''
ENV PLUGIN_SOURCE ''
COPY docker/*.sh /
COPY docker/.lftprc /
RUN chmod 700 /*.sh
ENTRYPOINT /entrypoint.sh
