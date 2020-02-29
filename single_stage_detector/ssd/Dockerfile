FROM pytorch/pytorch:1.0.1-cuda10.0-cudnn7-runtime

ADD . /

WORKDIR /

RUN apt-get update && \
    apt-get install -y python3-tk python-pip && \
    apt-get install -y numactl facter unzip curl bc

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python3 -m pip install pycocotools==2.0.0
