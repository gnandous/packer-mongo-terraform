data "terraform_remote_state" "" {
  backend = "s3"
  config {
    bucket = ""
    key    = ""
    region = ""
  }
}

terraform {
 required_version = ">= 0.11.3"
 backend "s3" {
   bucket = ""
   key    = ""
   region = ""
 }
}