#!/bin/bash

set -e

ssh root@$1 "bash -s" < upgrade.sh
