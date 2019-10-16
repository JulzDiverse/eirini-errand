#!/bin/bash

set -e

bosh -e vbox deploy -d eirini-installer manifest.yaml \
  -o operations/eirini.yaml \
  -o operations/bpm.yml \
  -v use_registry_ingress=false \
  -v registry_address="http://some-registry.somewhere.io" \
  -v ingress_endpoint="whatever" \
  -v cc_internal_api="https://cloud-controller-ng.service.cf.internal:9023" \
  -v cc_certs_secret_name="cc-certs" \
  -v nats_address="q-s0.nats.default.cf.bosh" \
  -v doppler_address="doppler.service.cf.internal:8082" \
  -v kube_config_flatten="$(kubectl config view --flatten=true)" \
  --vars-store deployment-vars.yml
