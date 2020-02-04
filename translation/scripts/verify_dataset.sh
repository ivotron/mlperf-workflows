#!/bin/bash
set -ex

cd ./translation/data

ACTUAL_TEST=`cat tensorflow/newstest2014.en | md5sum`
EXPECTED_TEST='4e4663b8de25d19c5fc1c4dab8d61703  -'
if [[ $ACTUAL_TEST = $EXPECTED_TEST ]]; then
  echo "OK: correct tensorflow/newstest2014.en"
else
  echo "ERROR: incorrect tensorflow/newstest2014.en"
  echo "ERROR: expected $EXPECTED_TEST"
  echo "ERROR: found $ACTUAL_TEST"
fi
ACTUAL_TEST=`cat tensorflow/newstest2014.de | md5sum`
EXPECTED_TEST='06e8840abe90cbfbd45cf2729807605d  -'
if [[ $ACTUAL_TEST = $EXPECTED_TEST ]]; then
  echo "OK: correct tensorflow/newstest2014.de"
else
  echo "ERROR: incorrect tensorflow/newstest2014.de"
  echo "ERROR: expected $EXPECTED_TEST"
  echo "ERROR: found $ACTUAL_TEST"
fi
ACTUAL_RAW=`find raw_data/ -type f -exec md5sum {} \; | sort -k 2 | md5sum`
EXPECTED_RAW='fb4469fa118fdae84f948f65c2a75ac8  -'
if [[ $ACTUAL_RAW = $EXPECTED_RAW ]]; then
  echo "OK: correct raw_data/"
else
  echo "ERROR: incorrect raw_data/"
  echo "ERROR: expected $EXPECTED_RAW"
  echo "ERROR: found $ACTUAL_RAW"
fi
