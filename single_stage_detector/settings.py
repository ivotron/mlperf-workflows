import os


engine_configuration = {
        "runtime": "nvidia",
        "volumes": [f"{os.path.join(os.getcwd(), 'coco')}:/data/coco"],
        "privileged": True,
 	"shm_size": "1G"
}
