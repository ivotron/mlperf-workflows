#!/bin/bash
set -ex

cd ./single_stage_detector/data/coco

ACTUAL_TEST=`train2017.zip | md5sum`
EXPECTED_TEST='2d2b9d2283adb5e3b8d25eec88e65064  -'
if [[ $ACTUAL_TEST = $EXPECTED_TEST ]]; then
  echo "OK: correct train2017.zip"
else
  echo "ERROR: incorrect train2017.zip"
  echo "ERROR: expected $EXPECTED_TEST"
  echo "ERROR: found $ACTUAL_TEST"
fi
ACTUAL_TEST=`cat val2017.zip | md5sum`
EXPECTED_TEST='f4bbac642086de4f52a3fdda2de5fa2c  -'
if [[ $ACTUAL_TEST = $EXPECTED_TEST ]]; then
  echo "OK: correct val2017.zip"
else
  echo "ERROR: incorrect val2017.zip"
  echo "ERROR: expected $EXPECTED_TEST"
  echo "ERROR: found $ACTUAL_TEST"
fi
ACTUAL_TEST=`cat annotations_trainval2017.zip | md5sum`
EXPECTED_TEST='cced6f7f71b7629ddf16f17bbcfab6b2  -'
if [[ $ACTUAL_TEST = $EXPECTED_TEST ]]; then
  echo "OK: correct annotations_trainval2017.zip"
else
  echo "ERROR: incorrect annotations_trainval2017.zip"
  echo "ERROR: expected $EXPECTED_TEST"
  echo "ERROR: found $ACTUAL_TEST"
fi