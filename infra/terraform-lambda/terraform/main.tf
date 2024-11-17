terraform {
  required_version = ">= 1.9"
  backend "s3" {
    bucket = "${var.bucket_name}"
    key    = "${var.candidate_number}/terraform.tfstate"
    region = "${var.region}"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}
