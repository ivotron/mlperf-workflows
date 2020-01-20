workflow "benchmark on object detection" {
    resolves = "run benchmark"
}

action "install dependencies" {
    uses = "./object_detection"
    runs = "./object_detection/install.sh"
}

action "download data" {
    needs = "install dependencies"
    uses = "docker://debian:buster-slim"
    runs = "./object_detection/download_dataset.sh"
}

action "run benchmark" {
    needs = "download data"
    uses = "./object_detection"
    runs = "./object_detection/run_and_time.sh"
}
