workflow "benchmark on object detection" {
    resolves = "run benchmark"
}

action "download data" {
    uses = "docker://debian:buster-slim"
    runs = "download_dataset.sh"
}

action "install dependencies" {
    uses = "./"
    runs = "install.sh"
}

action "run benchmark" {
    uses = "./"
    runs = "run_and_time.sh"
}
