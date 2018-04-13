provider "aws" {
  region = "us-east-1"
}

locals {
  env = "${terraform.workspace}"

  counts = {
    "dev"  = 1
    "prod" = 3
  }

  instances = {
    "dev"  = "t2.micro"
    "prod" = "t4.large"
  }

  instance_type = "${lookup(local.instances, local.env)}"
  count         = "${lookup(local.counts, local.env)}"
}

resource "aws_instance" "my_service" {
  ami           = "ami-7b4d7900"
  instance_type = "${local.instance_type}"
  count         = "${local.count}"
}
