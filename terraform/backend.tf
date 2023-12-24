terraform {
    backend "s3" {
    bucket = "terraform-state-file-11"
    encrypt = false
    key = "state.tfstate"
  }
}