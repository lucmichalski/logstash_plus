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

FROM docker.elastic.co/logstash/logstash-oss:6.1.4

ARG BUILD_DATE

LABEL org.opencontainers.image.created="$BUILD_DATE" \
      org.opencontainers.image.authors="rob@synesis.ai" \
      org.opencontainers.image.url="https://github.com/robcowart/logstash_plus/README.md" \
      org.opencontainers.image.documentation="https://github.com/robcowart/logstash_plus/README.md" \
      org.opencontainers.image.source="https://github.com/robcowart/logstash_plus" \
      org.opencontainers.image.version="0.0.1" \
      org.opencontainers.image.vendor="Robert Cowart" \
      org.opencontainers.image.title="Logstash Plus" \
      org.opencontainers.image.description="Logstash with additional and updated plugins." \
      org.opencontainers.image.licenses="Apache-2.0"


RUN $HOME/bin/logstash-plugin install \
    # Install additional outputs.
    logstash-output-clickhouse \
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
    logstash-filter-cache-redis \
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

RUN $HOME/bin/logstash-plugin update \
    # Update existing outputs.
    logstash-output-elasticsearch \
    logstash-output-kafka \
    logstash-output-rabbitmq \
    logstash-output-redis \
    logstash-output-http \
    logstash-output-file \
    logstash-output-sqs \
    logstash-output-stdout \
    # Update existing inputs.
    logstash-input-dead_letter_queue \
    logstash-input-elasticsearch \
    logstash-input-rabbitmq \
    logstash-input-redis \
    logstash-input-kafka \
    logstash-input-exec \
    logstash-input-http \
    logstash-input-http_poller \
    logstash-input-sqs \
    logstash-input-tcp \
    logstash-input-udp \
    # Update existing codecs.
    #logstash-codec-dots \
    #logstash-codec-edn \
    #logstash-codec-edn_lines \
    #logstash-codec-json \
    #logstash-codec-json_lines \
    #logstash-codec-multiline \
    logstash-codec-netflow \
    #logstash-codec-plain \
    logstash-codec-rubydebug \
    # Update existing filters.
    #logstash-filter-cidr \
    logstash-filter-clone \
    logstash-filter-csv \
    #logstash-filter-date \
    logstash-filter-dissect \
    #logstash-filter-drop \
    logstash-filter-dns \
    logstash-filter-fingerprint \
    logstash-filter-geoip \
    logstash-filter-grok \
    logstash-filter-json \
    logstash-filter-kv \
    logstash-filter-mutate \
    logstash-filter-ruby \
    logstash-filter-syslog_pri \
    logstash-filter-translate \
    logstash-filter-truncate \
    logstash-filter-useragent \
    logstash-filter-xml

ENTRYPOINT ["/usr/local/bin/docker-entrypoint"]
