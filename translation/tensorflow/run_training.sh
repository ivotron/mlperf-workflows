#!/bin/bash
set -ex

SEED=$1
QUALITY=$2

# Add compliance to PYTHONPATH
# export PYTHONPATH=/mlperf/training/compliance:${PYTHONPATH}

python3 transformer/transformer_main.py --random_seed=${SEED} --data_dir=../data/processed_data/ --model_dir=model --params=base --bleu_threshold ${QUALITY} --bleu_source=../data/tensorflow/newstest2014.en --bleu_ref=../data/tensorflow/newstest2014.de
