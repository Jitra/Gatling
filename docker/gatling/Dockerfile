FROM openjdk:8-jdk-alpine

ARG GATLING_RESULTS
ARG GATLING_RESULTS_NEWEST
ARG GATLING_VERSION

USER root
# working directory for gatling
WORKDIR /opt

# create directory for gatling install
RUN mkdir -p gatling \
    && mkdir -p $GATLING_RESULTS

# install gatling
RUN apk add --update --no-cache wget bash sudo  \
  && mkdir -p /tmp/downloads  \
  && wget -q -O /tmp/downloads/gatling-$GATLING_VERSION.zip \
     https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/$GATLING_VERSION/gatling-charts-highcharts-bundle-$GATLING_VERSION-bundle.zip \
  && mkdir -p /tmp/archive && cd /tmp/archive  \
  && unzip /tmp/downloads/gatling-$GATLING_VERSION.zip  \
  && mv /tmp/archive/gatling-charts-highcharts-bundle-$GATLING_VERSION/* /opt/gatling/ \
  && rm -rf /tmp/downloads

RUN apk add --no-cache \
        bash \
        util-linux \
        sudo \
    \
    && adduser -D -u 1000 bonnier \
    && adduser bonnier wheel \
    && chown -R bonnier:bonnier /home/bonnier \
    && chown -R bonnier:bonnier /opt/gatling \
    && echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# change context to gatling directory
WORKDIR  /opt/gatling

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY run.sh /usr/local/bin/run

USER bonnier

# LOCAL ENV
ENV PATH /opt/gatling/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV GATLING_HOME /opt/gatling

#ENTRYPOINT ["gatling.sh"]
ENTRYPOINT ["entrypoint.sh"]