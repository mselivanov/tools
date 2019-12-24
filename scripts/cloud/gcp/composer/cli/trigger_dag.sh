# COMPOSER_ENVIRONMENT - Google Cloud Composer environment name
# COMPOSER_LOCATION - Composer location, e.g. europe-west1
# EXECUTION_DATE - DAG execution date 
# DAG_ID - dag id

gcloud composer environments run ${COMPOSER_ENVIRONMENT} --location ${COMPOSER_LOCATION} trigger_dag -- -e ${EXECUTION_DATE} ${DAG_ID}
