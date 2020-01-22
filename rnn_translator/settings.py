
runtime_configuration = {
    "docker": {
        "runtime": "nvidia",
        "ipc_mode": "host",
        "volumes": ["/mnt/hdd/mlperf-benchmarks/rnn_translator/data:/data"]
    }
}
