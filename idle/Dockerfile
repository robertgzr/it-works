# vim: ft=dockerfile
FROM alpine:3
RUN apk add --update-cache --no-cache stress-ng
COPY ./start.sh /usr/local/bin/
CMD ["start.sh"]
