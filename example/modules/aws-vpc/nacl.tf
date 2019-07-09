# Create AWS NACL 

resource "aws_network_acl" "nacl" {
    vpc_id     = "${aws_vpc.main.id}"
    subnet_ids = []

    ingress {
        from_port  = 0
        to_port    = 0
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
    }

    egress {
        from_port  = 0
        to_port    = 0
        rule_no    = 100
        action     = "allow"
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
    }

    tags {
      Name      = "${var.my_company}-${var.my_env}-${var.aws_region}-nacl"
      region    = "${var.aws_region}"
      env       = "${var.my_env}"
      config_mgmt = "terraform"
      aws_type  = "nacl"
      company = "${var.my_company}"
      application = "${var.my_application}"
    }
}
