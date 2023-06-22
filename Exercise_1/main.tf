# TODO: Designate a cloud provider, region, and credentials


# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2


# TODO: provision 2 m4.large EC2 instances named Udacity M4
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Udacity_T2" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0babd91262195c30e"
  count         = 4
  tags = {
    "Name" = "Udacity T2"
  }
}

resource "aws_instance" "Udacity_M4" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "m4.large"
  subnet_id     = "subnet-0babd91262195c30e"
  count         = 2
  tags = {
    "Name" = "Udacity M4"
  }
}
