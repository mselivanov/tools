#!/bin/bash

source .env

export RAW_SCHEMA_PATH="${OUTPUT_ROOT}/${DATASET_ID}_${TABLE_ID}_schema_raw.json"
export QUERY_TYPE=$1

bq.cmd --format=prettyjson --project_id=${PROJECT_ID} show ${DATASET_ID}.${TABLE_ID} > "${RAW_SCHEMA_PATH}"
python generate_sql.py --query_type="${QUERY_TYPE}" --raw_schema="${RAW_SCHEMA_PATH}"
