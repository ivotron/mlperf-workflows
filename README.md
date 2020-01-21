# mlperf-benchmarks

### Steps to configure machine
Suggested environment : Ubuntu 16.04, 8 CPUs, one P100, 20GB disk

The following instructions modify `reference/install_cuda_docker.sh` script to install cuda 8.0 instead of 9.1 in addition to installing and configuring docker and nvidia-docker.

First, get cuda 8.0:

    wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
    sudo dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
    sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
    sudo apt-get update
    sudo apt-get install cuda-8.0

Next, install docker:

    sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
    sudo apt update
    sudo apt install docker-ce -y


Next, nvidia-docker2:

    curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID) && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
    sudo apt-get update
    sudo apt install nvidia-docker2 -y
    sudo pkill -SIGHUP dockerd
    
### Running Instructions

1. Clone the repository.
```
git clone https://github.com/blkswanio/mlperf-benchmarks
```

2. Install the `popper` tool.
```
pip install popper
```
You can also install it in a virtualenv.

### Object Detection
```
cd object_detection/
popper run --runtime-conf settings.py
```

### Sentiment Analysis
```
cd sentiment_analysis/
popper run --runtime-conf settings.py --wfile cuda.workflow
```

### Single Stage Detector
```
cd single_stage_detector/
popper run --runtime-conf settings.py 
```
