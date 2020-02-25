#!/bin/bash
set -ex
# Get COCO 2014 data sets

mkdir -p ./object_detection/data/coco
cd ./object_detection/data/coco

apt-get update
apt-get install -y curl unzip

if [ ! -f coco_annotations_minival.tgz ]; then
curl -O https://dl.fbaipublicfiles.com/detectron/coco/coco_annotations_minival.tgz
fi
tar xzf coco_annotations_minival.tgz

if [ ! -f train2014.zip ]; then
curl -O http://images.cocodataset.org/zips/train2014.zip
fi
unzip -o train2014.zip

if [ ! -f val2014.zip ]; then
curl -O http://images.cocodataset.org/zips/val2014.zip
fi
unzip -o val2014.zip

if [ ! -f annotations_trainval2014.zip ]; then
curl -O http://images.cocodataset.org/annotations/annotations_trainval2014.zip
fi
unzip -o annotations_trainval2014.zip

