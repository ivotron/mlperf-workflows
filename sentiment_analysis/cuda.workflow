workflow "benchmark on sentiment analysis" {
  resolves = "run benchmark"
}

action "download data" {
  uses = "docker://paddlepaddle/paddle:1.6.2-gpu-cuda9.0-cudnn7"
  args = "python ./sentiment_analysis/scripts/download.py"
}

action "verify data" {
  needs="download data"
  uses = "docker://paddlepaddle/paddle:1.6.2-gpu-cuda9.0-cudnn7"
  args = "python ./sentiment_analysis/scripts/verify.py"
}


action "run benchmark" {
  needs="verify data"
  uses = "docker://paddlepaddle/paddle:1.6.2-gpu-cuda9.0-cudnn7"
  runs = "/bin/bash ./sentiment_analysis/paddle/run_and_time.sh 2 -g"
}
