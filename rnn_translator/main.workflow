workflow "benchmark on rnn_translator" {
  resolves = "verify data"
}

action "download data" {
  uses = "docker://debian:buster-slim"
  args = "./rnn_translator/download_dataset.sh"
}

action "verify data" {
  needs = "download data"
  uses = "docker://debian:buster-slim"
  args = "./rnn_translator/verify_dataset.sh"
}
