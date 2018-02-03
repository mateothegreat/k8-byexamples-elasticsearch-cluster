<!--
#                                 __                 __
#    __  ______  ____ ___  ____ _/ /____  ____  ____/ /
#   / / / / __ \/ __ `__ \/ __ `/ __/ _ \/ __ \/ __  /
#  / /_/ / /_/ / / / / / / /_/ / /_/  __/ /_/ / /_/ /
#  \__, /\____/_/ /_/ /_/\__,_/\__/\___/\____/\__,_/
# /____                     matthewdavis.io, holla!
#
#-->

[![Clickity click](https://img.shields.io/badge/k8s%20by%20example%20yo-limit%20time-ff69b4.svg?style=flat-square)](https://k8.matthewdavis.io)
[![Twitter Follow](https://img.shields.io/twitter/follow/yomateod.svg?label=Follow&style=flat-square)](https://twitter.com/yomateod) [![Skype Contact](https://img.shields.io/badge/skype%20id-appsoa-blue.svg?style=flat-square)](skype:appsoa?chat)

# Elasticsearch

> k8 by example -- straight to the point, simple execution.

## Environment Variables

```sh
NS                      ?= es
SERVICE_ACCOUNT         ?= elasticsearch-service-account
ELASTICSEARCH_HOST      ?= elasticsearch
PORT_HTTP               ?= 9200
PORT_TRANSPORT          ?= 9300
CLUSTER_NAME            ?= cluster
NUMBER_OF_MASTERS       ?= 1
NUMBER_OF_CLIENTS       ?= 1
ES_JAVA_OPTS            ?= -Xms256m -Xmx256m
ES_PLUGINS_INSTALL      ?= "repository-gcs,ingest-user-agent"
```

## all targets

```sh
install:    services-install master-nodes-install client-nodes-install data-nodes-install
delete:     services-delete master-nodes-delete client-nodes-delete data-nodes-delete
get:        service-account-get cluster-role-get cluster-role-binding-get configmap-get daemonset-get
```

## make install

```sh
yomateod@proliant:k8-byexamples-elasticsearch-cluster$ make install

service "elasticsearch-discovery" created
service "elasticsearch" created

deployment "es-master" created
Waiting for rollout to finish: 0 of 1 updated replicas are available...
deployment "es-master" successfully rolled out

deployment "es-client" created

Waiting for rollout to finish: 0 of 1 updated replicas are available...
deployment "es-client" successfully rolled out

deployment "es-data" created
Waiting for rollout to finish: 0 of 2 updated replicas are available...
deployment "es-data" successfully rolled out
```
