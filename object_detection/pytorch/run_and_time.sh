#!/bin/bash
set -ex
# Runs benchmark and reports time to convergence
cd ./pytorch

# Install maskrcnn_benchmark
rm -Rf build/
python setup.py clean build develop --user

# start timing
start=$(date +%s)
start_fmt=$(date +%Y-%m-%d\ %r)
echo "STARTING TIMING RUN AT $start_fmt"

# Single GPU training
time python tools/train_mlperf.py --config-file "configs/e2e_mask_rcnn_R_50_FPN_1x.yaml" \
       SOLVER.IMS_PER_BATCH 2 TEST.IMS_PER_BATCH 1 SOLVER.MAX_ITER 7500 SOLVER.STEPS "(3750, 5000)" SOLVER.BASE_LR 0.02

if [[ $ret_code != 0 ]]; then exit $ret_code; fi

# end timing
end=$(date +%s)
end_fmt=$(date +%Y-%m-%d\ %r)
echo "ENDING TIMING RUN AT $end_fmt"

# report result
result=$(( $end - $start ))
result_name="maskrcnn"

echo "RESULT,$result_name,,$result,$USER,$start_fmt"

