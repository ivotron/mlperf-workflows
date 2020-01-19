#!/bin/bash

set -e

DATASET_DIR='/data'

SEED=${1:-"1"}
TARGET=${2:-"24.00"}
echo $SEED
# run training
python3 train.py \
  --dataset-dir ${DATASET_DIR} \
  --seed $SEED \
  --target-bleu $TARGET
