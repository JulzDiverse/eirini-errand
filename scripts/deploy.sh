#!/bin/bash

set -e

bosh -e vbox deploy -d eirini-installer manifest.yaml \
  -o operations/eirini.yaml \
  -o operations/bpm.yml \
  -v ingress_endpoint="not_set" \
  -v use_registry_ingress=false \
  -v registry_address="not_set" \
  -v cc_internal_api="not_set" \
  -v cc_certs_secret_name="not_set" \
  -v nats_address="not_set" \
  -v doppler_address="not_set" \
  -v doppler-cert="not_set" \
  -v doppler-cert-key="not_set" \
  -v cc-server-crt="not_set" \
  -v cc-server-crt-key="not_set" \
  -v eirini-client-crt="not_set" \
  -v eirini-client-crt-key="not_set" \
  -v internal-ca-cert="not_set" \
  -v kube_config_flatten="$(kubectl config view --flatten=true)" \
  --vars-store deployment-vars.yml
