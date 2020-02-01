#!/bin/bash
set -ex

# Generate the output directory
mkdir -p ./output/results/ssd
mkdir -p ./output/systems

apt-get update
apt-get install -y facter

# Save facter output
facter --json >  ./output/systems/system_details.json

# Run the training 5 times
counter=1
while [ $counter -le 5 ]
do
export COMPLIANCE_FILE="/results/ssd/result_${counter}.txt"
./single_stage_detector/ssd/run_and_time.sh
((counter++))
done
