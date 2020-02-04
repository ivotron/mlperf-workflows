workflow "benchmark on object detection" {
    resolves = "run benchmark"
}

action "download data" {
    uses = "docker://debian:buster-slim"
    runs = "./translation/scripts/download_dataset.sh"
}

action "verify data" {
    needs = "download data"
    uses = "docker://debian:buster-slim"
    runs = "./translation/scripts/verify_dataset.sh"
}

action "run benchmark" {
    needs = "download data"
    uses = "./translation/tensorflow"
    runs = "./translation/scripts/run_benchmark.sh"
}
