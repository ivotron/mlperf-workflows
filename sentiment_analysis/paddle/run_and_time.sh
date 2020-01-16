#!/bin/bash

# Start timing
start_time=$(date +%s)
start_fmt=$(date +%Y-%m-%d\ %r)
echo "STARTING TIMING RUN AT $start_fmt"

seed=$1
gpu=$2
echo "Running sentiment benchmark with seed $seed"

# Train a sentiment_analysis model (default: conv model), with a user
# specified seed
python ./sentiment_analysis/paddle/train.py -s ${seed} ${gpu}

# End timing
end_time=$(date +%s)
end_fmt=$(date +%Y-%m-%d\ %r)
echo "ENDING TIMING RUN AT $end_fmt"

# Report result
result=$(( ${end_time} - ${start_time} ))
result_name="sentiment"

echo "RESULT,$result_name,$seed,$result,$USER,$start_fmt"