#!/bin/bash
set -e

chown -R "$CONF_USER":"$CONF_USER" "$CONFLUENCE_HOME"

exec "$@"