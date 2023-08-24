FROM docker.io/alpine:3.18

LABEL maintainer = 'Tingyan Shen<tingyan.shen@gmail.com>'

ARG RELEASE

RUN apk add --no-cache openconnect
RUN apk add --no-cache --virtual .build-deps  git build-base linux-headers \
    && mkdir -p /usr/src/3proxy \
    && git clone https://github.com/3proxy/3proxy.git /usr/src/3proxy \
    && if [[ -z "${RELEASE}" ]]; then \
        RELEASE=$(git -C /usr/src/3proxy describe --tags \
                $(git -C /usr/src/3proxy rev-list --tags --max-count=1)); fi \
    && git -C /usr/src/3proxy checkout tags/$RELEASE \
    && make -C /usr/src/3proxy -f Makefile.Linux \
    && make -C /usr/src/3proxy -f Makefile.Linux install \
    && rm -r /usr/src/3proxy \
    && apk del .build-deps

COPY ./3proxy/3proxy.cfg /etc/3proxy/3proxy.cfg
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
