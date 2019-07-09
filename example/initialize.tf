# MODULE VARIABLES
module "aws-vpc" {
  source = "../modules/aws-vpc"

  # VARIABLES
  aws_account_id = "${var.aws_account_id}"
  aws_region = "${var.aws_region}"
  aws_cidr_block = "${var.aws_cidr_block}"
  aws_cidr_block_prefix = "${var.aws_cidr_block_prefix}"
  my_env = "${var.my_env}"
  my_application = "${var.my_application}"
  my_company = "${var.my_company}"
  my_domain = "${var.my_domain}"
}
