workflow "benchmark on object detection" {
    resolves = "run benchmark"
}

action "install dependencies" {
    uses = "./object_detection/pytorch"
    runs = "./object_detection/scripts/install.sh"
}

action "download data" {
    needs = "install dependencies"
    uses = "docker://debian:buster-slim"
    runs = "./object_detection/scripts/download_dataset.sh"
}

action "run benchmark" {
    needs = "download data"
    uses = "./object_detection/pytorch"
    runs = "./object_detection/scripts/run_benchmark.sh"
}
