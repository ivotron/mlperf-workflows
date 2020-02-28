workflow "benchmark on object detection" {
    resolves = "run benchmark"
}

action "download data" {
    uses = "./pytorch"
    runs = "./scripts/download_dataset.sh"
}

action "verify data" {
    needs = "download data"
    uses = "./pytorch"
    runs = "./scripts/verify_dataset.sh"
}

action "run benchmark" {
    needs = "verify data"
    uses = "./pytorch"
    runs = "./scripts/run_benchmark.sh"
}
