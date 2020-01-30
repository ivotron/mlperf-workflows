#!/bin/bash
set -ex
# Installs object_detection module
cd ./object_detection/pytorch
rm -Rf build/
python setup.py clean build develop --user
