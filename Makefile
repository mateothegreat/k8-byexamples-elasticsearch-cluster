#                                 __                 __
#    __  ______  ____ ___  ____ _/ /____  ____  ____/ /
#   / / / / __ \/ __ `__ \/ __ `/ __/ _ \/ __ \/ __  /
#  / /_/ / /_/ / / / / / / /_/ / /_/  __/ /_/ / /_/ /
#  \__, /\____/_/ /_/ /_/\__,_/\__/\___/\____/\__,_/
# /____                     matthewdavis.io, holla!
#
include .make/Makefile.inc

NS                      ?= default
SERVICE_ACCOUNT         ?= elasticsearch-service-account
ELASTICSEARCH_HOST      ?= elasticsearch
PORT_HTTP               ?= 9200
PORT_TRANSPORT          ?= 9300
CLUSTER_NAME            ?= cluster
NUMBER_OF_MASTERS       ?= 1
NUMBER_OF_CLIENTS       ?= 1
ES_JAVA_OPTS            ?= -Xms512m -Xmx512m
ES_PLUGINS_INSTALL      ?= "repository-gcs,ingest-user-agent"
ES_PLUGINS_INSTALL      ?= ""
export

# install:    services-install master-nodes-install client-nodes-install data-nodes-install
# delete:     services-delete master-nodes-delete client-nodes-delete data-nodes-delete
# get:        service-account-get cluster-role-get cluster-role-binding-get configmap-get daemonset-get

test:

	curl http://elasticsearch:9200/
	curl http://elasticsearch:9200/_cat/indices?pretty

services-install:

	envsubst < es-discovery-svc.yaml | kubectl --namespace $(NS) apply -f -
	envsubst < es-svc.yaml | kubectl --namespace $(NS) apply -f -

services-delete:

	envsubst < es-discovery-svc.yaml | kubectl --namespace $(NS) delete -f -
	envsubst < es-svc.yaml | kubectl --namespace $(NS) delete -f -

master-nodes-install:

	envsubst < es-master.yaml | kubectl --namespace $(NS) apply -f -
	envsubst < es-master.yaml | kubectl --namespace $(NS) rollout status -f -

master-nodes-delete:

	envsubst < es-master.yaml | kubectl --namespace $(NS) delete -f -

client-nodes-install:

	envsubst < es-client.yaml | kubectl --namespace $(NS) apply -f -
	envsubst < es-client.yaml | kubectl --namespace $(NS) rollout status -f -

client-nodes-delete:

	envsubst < es-client.yaml | kubectl --namespace $(NS) delete -f -

data-nodes-install:

	envsubst < es-data.yaml | kubectl --namespace $(NS) apply -f -
	envsubst < es-data.yaml | kubectl --namespace $(NS) rollout status -f -

data-nodes-delete:

	envsubst < es-data.yaml | kubectl --namespace $(NS) delete -f -

#
# DaemonSet
#
daemonset-install:

	envsubst < daemonset.yaml | kubectl --namespace $(NS) apply -f -

daemonset-delete:

	envsubst < daemonset.yaml | kubectl --namespace $(NS) delete -f -

daemonset-get:

	kubectl --namespace $(NS) get daemonset

#
# ConfigMap
#
configmap-install:

	envsubst < configmap.yaml | kubectl --namespace $(NS) apply -f -

configmap-delete:

	envsubst < configmap.yaml | kubectl --namespace $(NS) delete -f -

configmap-get:

	kubectl --namespace $(NS) get configmap

#  
# Service Account
#
service-account-install:

	envsubst < service-account.yaml | kubectl --namespace $(NS) apply -f -

service-account-delete:

	envsubst < service-account.yaml | kubectl --namespace $(NS) delete -f -

service-account-get:

	kubectl --namespace $(NS) get sa

#
# Cluster Role
#
cluster-role-install:

	envsubst < cluster-role.yaml | kubectl --namespace $(NS) apply -f -

cluster-role-delete:

	envsubst < cluster-role.yaml | kubectl --namespace $(NS) delete -f -

cluster-role-get:

	kubectl --namespace $(NS) get clusterrole

#
# Cluster Role Binding
#
cluster-role-binding-install:

	envsubst < cluster-role-binding.yaml | kubectl --namespace $(NS) apply -f -

cluster-role-binding-delete:

	envsubst < cluster-role-binding.yaml | kubectl --namespace $(NS) delete -f -

cluster-role-binding-get:

	kubectl --namespace $(NS) get clusterrolebinding
