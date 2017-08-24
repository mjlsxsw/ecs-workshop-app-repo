#!/usr/bin/env bash
docker exec anchore_cli anchore feeds sync
docker build -t mysite:test .
docker exec anchore_cli anchore analyze --image mysite:test
docker cp anchore_global.whitelist anchore_cli:/root/.anchore/conf/
docker exec anchore_cli anchore gate --image mysite:test
echo STATUS_CODE=$?
