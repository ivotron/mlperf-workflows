#!/bin/bash

set -e

python ./sentiment_analysis/scripts/download.py
python ./sentiment_analysis/scripts/verify.py