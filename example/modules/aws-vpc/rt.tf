# Create AWS Route Table
# Associate as Main Table
# Create AWS Route Table for NAT Gateway 

resource "aws_route_table" "rt1" {
    vpc_id     = "${aws_vpc.main.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }

    tags {
        Name      = "${var.my_company}-${var.my_env}-${var.aws_region}-rt"
        region    = "${var.aws_region}"
        env       = "${var.my_env}"
        config_mgmt = "terraform"
        aws_type  = "rt"
        company = "${var.my_company}"
        application = "${var.my_application}"
    }
}

resource "aws_main_route_table_association" "rta" {
  vpc_id         = "${aws_vpc.main.id}"
  route_table_id = "${aws_route_table.rt1.id}"
}

resource "aws_route_table" "rt-nat" {
    vpc_id     = "${aws_vpc.main.id}"

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.gw1.id}"
    }

    tags {
        Name      = "${var.my_company}-${var.my_env}-${var.aws_region}-rt-nat"
        region    = "${var.aws_region}"
        env       = "${var.my_env}"
        config_mgmt = "terraform"
        aws_type  = "rt"
        company = "${var.my_company}"
        application = "${var.my_application}"
    }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.sn_nat.id}"
  route_table_id = "${aws_route_table.rt-nat.id}"
}
