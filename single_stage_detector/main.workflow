workflow "benchmark on single stage detector" {
	resolves = "run benchmark"
}

action "download data" {
	uses = "./single_stage_detector/ssd"
	runs = "./single_stage_detector/scripts/download_dataset.sh"
}

action "verify data" {
	needs = "download data"
	uses = "./single_stage_detector/ssd"
        runs = "./single_stage_detector/scripts/verify_dataset.sh"
}

action "run benchmark" {
	needs = "verify data"
	uses = "./single_stage_detector/ssd"
        runs = "./single_stage_detector/scripts/run_benchmark.sh"
	env = {
		DGXSYSTEM = "DGX1_32"
	}
}
