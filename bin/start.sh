#!/bin/sh

docker compose -f infra/docker-compose.yml up --build --force-recreate
