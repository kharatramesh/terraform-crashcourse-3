terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.62.0"
    }
  }
}

provider "aws" {
access_key = var.akey
secret_key = var.skey
region = var.location
}

terraform {
  cloud {
    organization = "priar"
    ## Required for Terraform Enterprise; Defaults to app.terraform.io for Terraform Cloud
    hostname = "app.terraform.io"

    workspaces {
      tags = ["vadapav"]
    }
  }
}

resource "aws_s3_bucket" "b1" {
  bucket = "tc-bucket1-090824"

}

resource "aws_s3_bucket" "b2" {
  bucket = "tc-bucket2-090824"

}

resource "aws_s3_bucket" "b3" {
  bucket = "tc-bucket3-090824"
}

resource "aws_s3_bucket" "b4" {
  bucket = "tc-bucket4-090824"
}

resource "aws_instance" "vm1" {

  ami = "ami-025fe52e1f2dc5044"
  instance_type = "t2.nano"
  tags = {
    "Name" = "test"
  }
}
  