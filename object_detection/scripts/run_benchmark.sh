#!/bin/bash
set -ex

# Generate the output directory
mkdir -p ./results/maskrcnn
mkdir -p ./results/systems

# Save facter output
facter --json >  ./results/systems/system_details.json

# Run the training 5 times
counter=1
while [ $counter -le 5 ]
do
export COMPLIANCE_FILE="/results/maskrcnn/result_${counter}.txt"
./pytorch/run_and_time.sh
((counter++))
done
