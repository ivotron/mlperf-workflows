#!/bin/bash
set -ex

# Get COCO 2017 data sets
apt-get update
apt-get -y install curl unzip

mkdir -p ./single_stage_detector/coco; cd ./single_stage_detector/coco
curl -O http://images.cocodataset.org/zips/train2017.zip; unzip train2017.zip
curl -O http://images.cocodataset.org/zips/val2017.zip; unzip val2017.zip
curl -O http://images.cocodataset.org/annotations/annotations_trainval2017.zip; unzip annotations_trainval2017.zip

