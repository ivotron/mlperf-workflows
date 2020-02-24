#!/bin/bash
set -ex

# Generate the output directory
mkdir -p ./results/ssd
mkdir -p ./results/systems

apt-get update
apt-get install -y facter

# Save facter output
facter --json >  ./results/systems/system_details.json

# Run the training 5 times
counter=1
while [ $counter -le 5 ]
do
export COMPLIANCE_FILE="/results/ssd/result_${counter}.txt"
./single_stage_detector/ssd/run_and_time.sh
((counter++))
done
