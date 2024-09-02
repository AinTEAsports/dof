#!/usr/bin/env bash

GITBRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"

if [[ -z "$GITBRANCH" ]]; then echo ""
else echo " $GITBRANCH"
fi
