# Create Subnet in Availability Zone A

resource "aws_subnet" "sn_nat" {
    vpc_id                  = "${aws_vpc.main.id}"
    cidr_block              = "${var.aws_cidr_block_prefix}.10.0/24"
    availability_zone       = "${var.aws_region}a"
    map_public_ip_on_launch = true

    tags {
      Name      = "${var.my_company}-${var.my_env}-${var.aws_region}-sn-nat"
      az        = "${var.aws_region}a"
      region    = "${var.aws_region}"
      env       = "${var.my_env}"
      config_mgmt = "terraform"
      aws_type  = "sn"
    }
}
