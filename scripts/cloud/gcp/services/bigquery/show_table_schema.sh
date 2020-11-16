#!/bin/bash

# Script shows table schema in json format
# Table fqn - table fully qualified name: project_id:dataset_id.table_id
bq show --format=prettyjson ${TABLE_FQN}
