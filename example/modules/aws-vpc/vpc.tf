# Create AWS VPC 

resource "aws_vpc" "main" {
  cidr_block       = "${var.aws_cidr_block}"
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags {
    Name      = "${var.my_company}-${var.my_env}-${var.aws_region}-vpc"
    region    = "${var.aws_region}"
    env       = "${var.my_env}"
    config_mgmt = "terraform"
    aws_type  = "vpc"
    company = "${var.my_company}"
    application = "${var.my_application}"
  }
}
