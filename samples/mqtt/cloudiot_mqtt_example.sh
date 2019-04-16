#!/bin/sh

# read external variables.
. ./variables.inc

python ./cloudiot_mqtt_example.py \
  --registry_id=$REGISTRY_ID \
  --project_id=$PROJECT_ID \
  --cloud_region=$CLOUD_REGION \
  --device_id=$DEVICE_ID \
  --algorithm=RS256 \
  --private_key_file=./rsa_private.pem
