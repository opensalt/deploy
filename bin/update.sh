#!/bin/bash

cd $(dirname $0)/..

./bin/db_migrate.sh
