#!/bin/bash
# HOST - hostname or IP
# PORT - port for checking

(echo >/dev/tcp/${HOST}/${PORT} ) &>/dev/null && "Port ${PORT} is open at ${HOST}" || "Port ${PORT} is closed at ${HOST}" 
