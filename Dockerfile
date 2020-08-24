#------------------------------------------------------------------------------
# Copyright (C)2019 Robert Cowart
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#------------------------------------------------------------------------------

FROM docker.elastic.co/logstash/logstash-oss:7.9.0

ARG BUILD_DATE

LABEL org.opencontainers.image.created="$BUILD_DATE" \
      org.opencontainers.image.authors="rob@synesis.ai" \
      org.opencontainers.image.url="https://github.com/robcowart/logstash_plus/README.md" \
      org.opencontainers.image.documentation="https://github.com/robcowart/logstash_plus/README.md" \
      org.opencontainers.image.source="https://github.com/robcowart/logstash_plus" \
      org.opencontainers.image.version="0.0.2" \
      org.opencontainers.image.vendor="Robert Cowart" \
      org.opencontainers.image.title="Logstash Plus" \
      org.opencontainers.image.description="Logstash with additional and updated plugins." \
      org.opencontainers.image.licenses="Apache-2.0"


RUN $HOME/bin/logstash-plugin install \
    # Install additional outputs.
    logstash-output-google_pubsub \
    logstash-output-influxdb \
    logstash-output-mongodb \
    logstash-output-mqtt \
    # Install additional inputs.
    logstash-input-azure_event_hubs \
    logstash-input-google_pubsub \
    logstash-input-kinesis \
    logstash-input-mqtt \
    # Install additional codecs.
    logstash-codec-avro \
    logstash-codec-gzip_lines \
    logstash-codec-protobuf \
    logstash-codec-sflow \
    # Install additional filters.
    logstash-filter-base64 \
    logstash-filter-cidrtagmap \
    logstash-filter-foreach \
    logstash-filter-ip2location \
    logstash-filter-ip2proxy \
    logstash-filter-json_encode \
    logstash-filter-math \
    logstash-filter-memcached \
    logstash-filter-private_geoip \
    logstash-filter-sanitize_mac \
    logstash-filter-sentimentalizer \
    logstash-filter-uuid

RUN $HOME/bin/logstash-plugin update

ENTRYPOINT ["/usr/local/bin/docker-entrypoint"]
