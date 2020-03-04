#!/bin/bash
set -ex

mkdir -p ./results/systems

facter --json > ./results/systems/system_info.json
