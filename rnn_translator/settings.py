import os

engine_configuration = {
        "runtime": "nvidia",
        "ipc_mode": "host",
        "volumes": [
		f"{os.path.join(os.getcwd(), 'scripts/data')}:/data",
		f"{os.path.join(os.getcwd(), 'output/results')}:/results"
	]
}
