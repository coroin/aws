FROM alpine

MAINTAINER Coroin LLC <info@coroin.com>

RUN apk --no-cache add groff python py-pip \
    && pip install awscli \
    && apk --purge del py-pip \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apk/*

VOLUME /root/.aws
VOLUME /project

WORKDIR /project

ENTRYPOINT ["aws"]
