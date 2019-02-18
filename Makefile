#                                 __                 __
#    __  ______  ____ ___  ____ _/ /____  ____  ____/ /
#   / / / / __ \/ __ `__ \/ __ `/ __/ _ \/ __ \/ __  /
#  / /_/ / /_/ / / / / / / /_/ / /_/  __/ /_/ / /_/ /
#  \__, /\____/_/ /_/ /_/\__,_/\__/\___/\____/\__,_/
# /____                     matthewdavis.io, holla!
#
include .make/Makefile.inc

NS                      ?= default
APP						?= elasticsearch
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
GCE_ZONE				?= us-east1-b
GCE_DISK				?= es-data2

create-disk:

	gcloud compute disks create $(GCE_DISK) --zone $(GCE_ZONE) --type pd-ssd --size 100

delete-disk:

	gcloud compute disks delete $(GCE_DISK) --zone $(GCE_ZONE)
