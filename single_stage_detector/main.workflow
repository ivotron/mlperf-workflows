workflow "benchmark on single stage detector" {
	resolves = "run benchmark"
}

action "download data" {
	uses = "./ssd"
	runs = "./scripts/download_dataset.sh"
}

action "verify data" {
	needs = "download data"
	uses = "./ssd"
        runs = "./scripts/verify_dataset.sh"
}

action "run benchmark" {
	needs = "verify data"
	uses = "./ssd"
        runs = "./scripts/run_benchmark.sh"
	env = {
		DGXSYSTEM = "DGX1_32"
	}
}
