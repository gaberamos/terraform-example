# AWS Security Group for Webserver allowing all traffic over 443 (HTTPS) and Outbound all

resource "aws_security_group" "sg-web" {
    name        = "${var.my_company}-${var.my_env}-${var.aws_region}-sg-web"
    description = "${var.my_company}-${var.my_env}-${var.aws_region}-sg-web"
    vpc_id      = "${aws_vpc.main.id}"

    ingress {
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags {
        Name      = "${var.my_company}-${var.my_env}-${var.aws_region}-sg-web"
        region    = "${var.aws_region}"
        env       = "${var.my_env}"
        config_mgmt = "terraform"
        aws_type  = "sg"
        company = "${var.my_company}"
        application = "${var.my_application}"
    }
}
