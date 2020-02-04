#!/bin/bash
set -ex

SEED=$1

# Add compliance to PYTHONPATH
# export PYTHONPATH=/mlperf/training/compliance:${PYTHONPATH}

python3 transformer/process_data.py --raw_dir ../data/raw_data/ --data_dir ../data/processed_data
