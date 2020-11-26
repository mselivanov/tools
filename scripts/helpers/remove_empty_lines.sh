#!/bin/env bash
# sed reads input line by line, brings line into the pattern space and performs modifications
sed -i.bak '/^$/d' $1
