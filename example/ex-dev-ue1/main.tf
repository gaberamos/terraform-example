# GLOBAL VARIABLES
# MODIFY PER ENVIRONMENT

provider "aws" {
  region = "${var.aws_region}"
  shared_credentials_file = "/Users/$USER/.aws/credentials"
  profile                 = "default"
}

variable "aws_account_id" {
  default = "1234567890"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "my_domain" {
  default = "mycompany.com"
}

variable "my_company" {
  default = "ex"
}

variable "my_application" {
  default = "myapp"
}

variable "my_env" {
  default = "dev"
}

variable "aws_cidr_block" {
  default = "10.10.0.0/16"
}

variable "aws_cidr_block_prefix" {
  default = "10.10"
}
