workflow "benchmark on single stage detector" {
	resolves = "run benchmark"
}

action "download dataset" {
	uses = "docker://debian:buster-slim"
	runs = "./single_stage_detector/scripts/download_dataset.sh"
}

action "run benchmark" {
	needs = "download dataset"
	uses = "./single_stage_detector/ssd"
        runs = "./single_stage_detector/ssd/run_and_time.sh"
	env = {
		DGXSYSTEM = "DGX1_32"
	}
}
