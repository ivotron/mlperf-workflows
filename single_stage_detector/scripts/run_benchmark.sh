#!/bin/bash
set -ex

timestamp=$(date "+%Y%m%d-%H%M%S")

# Generate the output directory
mkdir -p ./results/closed/$timestamp/ssd
ln -sfn $timestamp/ ./results/closed/latest

declare -i run_times

# Run the training 5 times
counter=1
while [ $counter -le 5 ]
do
export COMPLIANCE_FILE="/workspace/results/closed/$timestamp/ssd/result_${counter}.txt"
. ./ssd/run_and_time.sh
run_times+=($result)
((counter++))
done

sorted_test_arr=( $( printf "%s\n" "${run_times[@]}" | sort -n ) )
unset sorted_test_arr[0]
unset sorted_test_arr[4]

sum=0

for i in ${sorted_test_arr[@]}
do
  sum=`expr $sum + $i`
done

BENCHMARK_RESULT=$(echo "$sum/3" | bc -l)
echo $BENCHMARK_RESULT
