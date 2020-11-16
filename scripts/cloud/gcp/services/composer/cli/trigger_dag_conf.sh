#!/usr/bin/env bash
# COMPOSER_ENVIRONMENT - Google Cloud Composer environment name
# COMPOSER_LOCATION - Composer location, e.g. europe-west1
# DAG_ID - dag id
# DAG_CONF - dag run configuration


set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

echo "Running DAG ${DAG_ID} with ${DAG_CONF}"
gcloud composer environments run ${COMPOSER_ENVIRONMENT} --location ${COMPOSER_LOCATION} trigger_dag -- --conf "${DAG_CONF}" "${DAG_ID}"
