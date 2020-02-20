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
DISK_SIZE_GB            ?= 100
AWS_ZONE                ?= us-east-1a
AWS_VOLUME_ID           ?= vol-000f68b8a0544e05c
GCE_ZONE				?= us-central1-a
GCE_DISK				?= es-data-1
ELASTICSEARCH_VERSION   ?= 7.5.2

create-disk-gcp:

	gcloud compute disks create $(GCE_DISK) --zone $(GCE_ZONE) --type pd-standard --size 1024

aws/create-disk:

	aws ec2 create-volume --availability-zone=$(AWS_ZONE) --size=$(DISK_SIZE_GB) --volume-type=gp2

delete-disk:

	gcloud compute disks delete $(GCE_DISK) --zone $(GCE_ZONE)
