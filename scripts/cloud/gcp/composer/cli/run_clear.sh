# COMPOSER_ENVIRONMENT - Google Cloud Composer environment name
# COMPOSER_LOCATION - Composer location, e.g. europe-west1
# START_DATE - backfill start date in YYYY-MM-DD format
# END_DATE - backfill end date in YYYY-MM-DD format
# DAG_ID - dag id

gcloud composer environments run ${COMPOSER_ENVIRONMENT} --location ${COMPOSER_LOCATION} backfill -- -s ${START_DATE} -e ${END_DATE} ${DAG_ID}
