FROM alpine
RUN apk add --update --no-cache openssh-client bash lftp moreutils
ENV PLUGIN_USERNAME="user@example.com" \
    PLUGIN_PASSWORD="" \
    PLUGIN_HOST="ssh.example.com" \
    PLUGIN_TARGET="/var/www/public" \
    PLUGIN_SOURCE="public"
COPY docker /
RUN chmod 700 /*.sh
ENTRYPOINT /entrypoint.sh
