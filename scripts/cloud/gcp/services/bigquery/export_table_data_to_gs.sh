#!/bin/bash

# Script shows table schema in json format
# Table fqn - table fully qualified name: project_id:dataset_id.table_id
# GS_DESTINATION - url to a file on a Google Storage bucket

bq extract --destination_format=CSV --delimiter=; --print_header=true "${TABLE_FQN}" "${GS_DESTINATION}"
