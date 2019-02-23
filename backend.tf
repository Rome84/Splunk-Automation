terraform {
  backend "s3" {
    bucket = "terraform-infra-splunk-version1"
    key = "versionv1"
  }
}
