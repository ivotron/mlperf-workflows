#!/bin/bash
set -ex

# Generate the output directory
mkdir -p ./results/gnmt
mkdir -p ./results/systems

apt-get update
apt-get install -y facter

# Save facter output
facter --json >  ./results/systems/system_details.json

# Run the training 5 times
counter=1
while [ $counter -le 5 ]
do
export COMPLIANCE_FILE="/gnmt/result_${counter}.txt"
./rnn_translator/pytorch/run_and_time.sh 1
((counter++))
done
