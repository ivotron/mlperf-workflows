import os

ENGINE = {
        "runtime": "nvidia",
        "ipc_mode": "host",
	 "volumes": [
		f"{os.path.join(os.getcwd(), './results')}:/results"
	]
}
