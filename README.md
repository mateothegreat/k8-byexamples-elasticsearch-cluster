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
NS                      ?= default
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

## Usage

```sh
$ make help

Usage:

  make <target>

Targets:

  manifests            Output manifests detected (used with make install, delete, get, describe, etc)
  install              Installs manifests to kubernetes using kubectl apply (make manifests to see what will be installed)
  delete               Deletes manifests to kubernetes using kubectl delete (make manifests to see what will be installed)
  get                  Retrieves manifests to kubernetes using kubectl get (make manifests to see what will be installed)
  describe             Describes manifests to kubernetes using kubectl describe (make manifests to see what will be installed)
```

## Install

```sh
$ make install

[ INSTALLING MANIFESTS/ES-CLIENT.YAML ]: deployment "es-client" created
[ INSTALLING MANIFESTS/ES-DATA.YAML ]: deployment "es-data" created
[ INSTALLING MANIFESTS/ES-DISCOVERY-SVC.YAML ]: service "elasticsearch-discovery" created
[ INSTALLING MANIFESTS/ES-MASTER.YAML ]: deployment "es-master" created
[ INSTALLING MANIFESTS/ES-SVC.YAML ]: service "elasticsearch" created
```

## Testing

```sh
$ make test

curl http://elasticsearch:9200/

{  "name" : "es-client-77b9c8465f-lrsth",
  "cluster_name" : "cluster",
  "cluster_uuid" : "27_5x9EITdWQuiZ31N3shA",
  "version" : {
    "number" : "6.1.2",
    "build_hash" : "5b1fea5",
    "build_date" : "2018-01-10T02:35:59.208Z",
    "build_snapshot" : false,
    "lucene_version" : "7.1.0",
    "minimum_wire_compatibility_version" : "5.6.0",
    "minimum_index_compatibility_version" : "5.0.0"
  },
  "tagline" : "You Know, for Search"
}

curl http://elasticsearch:9200/_cat/indices?pretty

green open .kibana             DYwSiEEnTGmxDoGhM3R91Q 1 1    2 0 20.3kb 10.1kb
green open logstash-2018.02.18 CBZTdN6NSleDdePt3nv1AA 5 1 3472 0  3.3mb  1.5mb
```

# Delete

```sh
 make delete

[ DELETING MANIFESTS/ES-CLIENT.YAML ]: deployment "es-client" deleted
[ DELETING MANIFESTS/ES-DATA.YAML ]: deployment "es-data" deleted
[ DELETING MANIFESTS/ES-DISCOVERY-SVC.YAML ]: service "elasticsearch-discovery" deleted
[ DELETING MANIFESTS/ES-MASTER.YAML ]: deployment "es-master" deleted
[ DELETING MANIFESTS/ES-SVC.YAML ]: service "elasticsearch" deleted
```
