terraform {
  backend "s3" {
    bucket = "terraform-infra-splunk-version7"
    key = "Rome"
  }
}
