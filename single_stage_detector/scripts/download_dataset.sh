#!/bin/bash
set -ex

# Get COCO 2017 data sets
apt-get update
apt-get -y install curl unzip

mkdir -p ./single_stage_detector/data/coco
cd ./single_stage_detector/data/coco

if [ ! -f train2017.zip ]; then
curl -O http://images.cocodataset.org/zips/train2017.zip
fi
unzip -o train2017.zip

if [ ! -f val2017.zip ]; then
curl -O http://images.cocodataset.org/zips/val2017.zip
fi
unzip -o val2017.zip

if [ ! -f annotations_trainval2017.zip ]; then
curl -O http://images.cocodataset.org/annotations/annotations_trainval2017.zip
fi
unzip -o annotations_trainval2017
