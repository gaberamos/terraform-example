# Create AWS S3 Bucket
# company-env-my-bucket
# company-env-my-s3-logs

resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.my_company}-${var.my_env}-my-bucket"
  acl    = "private"

  lifecycle_rule {
      id      = "expire after 14 days"
      enabled = true

      expiration {
        days = 14
      }
    }

  server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm     = "AES256"
        }
      }
    }

  logging {
      target_bucket = "${var.my_company}-${var.my_env}-my-s3-logs"
      target_prefix = "${var.my_company}-${var.my_env}-my-bucket"
    }

  tags {
    Name      = "${var.my_company}-${var.my_env}-my-bucket"
    region    = "${var.aws_region}"
    env       = "${var.my_env}"
    config_mgmt = "terraform"
    aws_type  = "s3"
    company = "${var.my_company}"
    application = "${var.my_application}"
  }
}

resource "aws_s3_bucket" "my_s3_logs" {
  bucket = "${var.my_env}-my-s3-logs"
  acl    = "private"

  lifecycle_rule {
      id      = "expire after 14 days"
      enabled = true

      expiration {
        days = 14
      }
    }

  server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm     = "AES256"
        }
      }
    }

  logging {
      target_bucket = "${var.my_company}-${var.my_env}-my-s3-logs"
      target_prefix = "${var.my_company}-${var.my_env}-my-s3-logs/"
    }

  tags {
    Name      = "${var.my_company}-${var.my_env}-my-s3-logs"
    region    = "${var.aws_region}"
    env       = "${var.my_env}"
    config_mgmt = "terraform"
    aws_type  = "s3"
    company = "${var.my_company}"
    application = "${var.my_application}"
  }
}
