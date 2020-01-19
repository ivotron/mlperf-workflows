workflow "benchmark on single stage detector" {
	resolves = "run benchmark"
}

action "download dataset" {
	uses = "docker://debian:buster-slim"
	runs = "./single_stage_detector/download_dataset.sh"
}

action "run benchmark" {
	needs = "download dataset"
	uses = "./single_stage_detector/ssd"
        runs = "./single_stage_detector/ssd/run_and_time.sh"
	env = {
		DATASET_DIR = "/mnt/hdd/mlperf-benchmarks/datasets/single_stage_detector/coco"
		DGXSYSTEM = "DGX1_32"
	}
}
