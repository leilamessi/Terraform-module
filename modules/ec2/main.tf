terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "demo" {
  ami           = var.ami
  instance_type = var.instance-type
  tags = {
    Name = var.name
  }
}


