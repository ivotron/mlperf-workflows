import os


engine_configuration = {
        "runtime": "nvidia",
        "volumes": [
		f"{os.path.join(os.getcwd(), '../results')}:/results"
	],
	"privileged": True,
 	"shm_size": "1G"
}
