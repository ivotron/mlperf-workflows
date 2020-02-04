#!/bin/bash
set -ex

apt-get update
apt-get install -y wget python3

mkdir -p ./translation/data/tensorflow;
wget https://nlp.stanford.edu/projects/nmt/data/wmt14.en-de/newstest2014.en -O ./translation/data/tensorflow/newstest2014.en
wget https://nlp.stanford.edu/projects/nmt/data/wmt14.en-de/newstest2014.de -O ./translation/data/tensorflow/newstest2014.de

python3 ./translation/scripts/data_download.py --raw_dir ./translation/data/raw_data
