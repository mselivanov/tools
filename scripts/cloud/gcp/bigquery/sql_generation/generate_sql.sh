#!/bin/bash

bq --format=prettyjson --project_id=${PROJECT_ID} show ${DATASET_ID}.${TABLE_ID} > ${OUTPUT_FILE}
