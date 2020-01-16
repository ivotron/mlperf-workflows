workflow "benchmark on object detection" {
    resolves = "run benchmark"
}

action "download data" {
    uses = "docker://debian:buster-slim"
    runs = "./object_detection/download_dataset.sh"
}

action "install dependencies" {
    needs = "download data"
    uses = "./object_detection"
    runs = "./object_detection/install.sh"
}

action "run benchmark" {
    needs = "install dependencies"
    uses = "./object_detection"
    runs = "./object_detection/run_and_time.sh"
}