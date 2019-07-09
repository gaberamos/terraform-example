# Create AWS Internet Gateway 

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name      = "${var.my_company}-${var.my_env}-${var.aws_region}-igw"
    region    = "${var.aws_region}"
    env       = "${var.my_env}"
    config_mgmt = "terraform"
    aws_type  = "igw"
    company = "${var.my_company}"
    application = "${var.my_application}"
  }
}
