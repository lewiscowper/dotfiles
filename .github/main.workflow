workflow "Test on push" {
  on = "push"
  resolves = ["test"]
}

action "test" {
  uses = "docker://r.j3ss.co/shellcheck"
  args = "./test.sh"
}
