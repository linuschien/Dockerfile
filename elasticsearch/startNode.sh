#!/bin/bash
docker run -d --env ES_HEAP_SIZE=1g --name=es-node$1 --privileged -p 920$1:9200 -p 930$1:9300 -v /opt/docker/elasticsearch/config:/config -v /opt/docker/elasticsearch/node$1:/data elasticsearch:1.5.1 /elasticsearch/bin/elasticsearch -Des.config=/config/elasticsearch.yml -Des.http.publish_port=920$1 -Des.transport.publish_port=930$1 -Des.node.name=es-node$1
