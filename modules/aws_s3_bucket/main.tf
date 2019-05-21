locals {
  name        = "${var.bucket_name}"
  bucket_name = "${local.name}"
  bucket_arn  = "${aws_s3_bucket.main.arn}"
  bucket_id   = "${aws_s3_bucket.main.id}"
  sse_algo    = "AES256"
  versioning  = "${var.versioning}"

}

resource "aws_s3_bucket" "main" {
  bucket = "${local.bucket_name}"
  acl = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "${local.sse_algo}"
      }
    }
  }

  versioning {
    enabled = "${local.versioning}"
  }

  tags {
    Name      = "${local.bucket_name}"
    tfModule  = "aws_s3_bucket"
    tfVersion = "${local.version}"
  }
}
