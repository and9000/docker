#!/bin/bash
set -e

chown -R "$BAMBOO_USER":"$BAMBOO_USER" "$BAMBOO_HOME"

exec "$@"