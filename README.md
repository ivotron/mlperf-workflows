# mlperf-benchmarks

## Steps to configure the machine

1. Clone the repository.
```
git clone https://github.com/blkswanio/mlperf-benchmarks
```

2. Install docker, cuda-runtime and nvidia-docker on the machine.
```
cd mlperf-benchmarks/
./install_cuda_docker.sh
```

3. Install the `popper` tool.
```
pip install popper
```

You can also install it in a [virtualenv](https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/#creating-a-virtual-environment).
 
## Running the benchmarks

### Object Detection
```
cd object_detection/
popper run --engine-conf settings.py
```

### Sentiment Analysis
```
cd sentiment_analysis/
popper run --engine-conf settings.py
```

### Single Stage Detector
```
cd single_stage_detector/
popper run --engine-conf settings.py 
```

### RNN translator
```
cd rnn_translator/
popper run --engine-conf settings.py
```

### Benchmark output

```
output/
    results/
         ssd/
            result_1.txt
            .
            .
            result_5.txt
         maskrcnn/
            .
            .
         gnmt/
    systems/
         system_details.json
```
On running the benchmarks, a directory structure like the one above would be generated in the root of the repository.
