# Create AWS Elastic IP, and attach to NAT Gateway 

resource "aws_eip" "nat1" {
  vpc           = true
  tags {
    Name      = "${var.my_company}-${var.my_env}-${var.aws_region}-eip-${var.my_application}"
    region    = "${var.aws_region}"
    env       = "${var.my_env}"
    config_mgmt = "terraform"
    aws_type  = "eip"
    company = "${var.my_company}"
    application = "${var.my_application}"
  }
}

resource "aws_nat_gateway" "gw1" {
  allocation_id = "${aws_eip.nat1.id}"
  subnet_id     = "${aws_subnet.sn_nat.id}"

  tags {
    Name      = "${var.my_company}-${var.my_env}-${var.aws_region}-nat-${var.my_application}"
    region    = "${var.aws_region}"
    env       = "${var.my_env}"
    config_mgmt = "terraform"
    aws_type  = "nat"
    company = "${var.my_company}"
    application = "${var.my_application}"
  }
}
