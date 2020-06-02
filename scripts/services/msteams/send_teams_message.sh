#!/usr/bin/env bash

source .env
export MSG="$(< ./test_message.json)"

curl -H 'Content-Type: application/json' -d "${MSG}" ${WEBHOOK_URL} 
