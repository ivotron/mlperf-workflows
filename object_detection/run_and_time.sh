#!/bin/bash
set -ex
# Runs benchmark and reports time to convergence
cd ./object_detection
pushd pytorch

# Single GPU training
time python tools/train_mlperf.py --config-file "configs/e2e_mask_rcnn_R_50_FPN_1x.yaml" \
       SOLVER.IMS_PER_BATCH 2 TEST.IMS_PER_BATCH 1 SOLVER.MAX_ITER 7500 SOLVER.STEPS "(3750, 5000)" SOLVER.BASE_LR 0.02

popd
