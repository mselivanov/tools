#!/bin/bash

# Patches table schema
bq update ${PROJECT_ID}:${DATASET_ID}.${TABLE_ID} ${PATH_TO_SCHEMA}
