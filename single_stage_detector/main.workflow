workflow "single stage detector" {
	resolves = "download"
}

action "download" {
	uses = "docker://debian:buster-slim"
	runs = "./single_stage_detector/download_dataset.sh"
}

action "run" {
	uses = "./single_stage_detector/ssd"
        runs = "./single_stage_detector/ssd/run_and_time.sh"
	env = {
		DATASET_DIR = "/mnt/hdd/training/datasets/single_stage_detector/coco"
		DGXSYSTEM = "DGX1_32"
	}
}
