#!/usr/bin/env bash
# COMPOSER_ENVIRONMENT - Google Cloud Composer environment name
# COMPOSER_LOCATION - Composer location, e.g. europe-west1
# Script expects three input parameters:
# dag_id - dag id
# - start_date - start date of triggering dag (iso-8601, inclusive)
# - end_date - end date of triggering dag (iso-8601, exclusive)

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

trigger_dag(){
	_dag_id=${1}
	_current_date=${2}
	_end_date=${3}


	while [[ ${_current_date} < ${_end_date} ]]; do
		echo "Running DAG ${_dag_id} for ${_current_date}..."
		gcloud composer environments run ${COMPOSER_ENVIRONMENT} --location ${COMPOSER_LOCATION} trigger_dag -- -e ${_current_date} ${_dag_id}
		_current_date=$(date --iso-8601 -d "${_current_date} + 1 day")
	done
}
gcloud auth list
trigger_dag $1 $2 $3
