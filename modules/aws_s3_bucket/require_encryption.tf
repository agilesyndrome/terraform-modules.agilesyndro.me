data "aws_iam_policy_document" "require_encryption" {
  statement {
    sid    = "EncryptedS3Uploads"
    effect = "Deny"

    condition {
      test     = "Null"
      variable = "s3:x-amz-server-side-encryption"
      values   = [true]
    }

    resources = [
      "${local.bucket_arn}/*",
    ]

    actions = [
      "s3:PutObject",
    ]
  }

  statement {
    sid    = "EncryptedS3Downloads"
    effect = "Deny"

    resources = [
      "${local.bucket_arn}/*",
    ]

    actions = [
      "s3:GetObject",
    ]

    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = [false]
    }
  }
}

resource "aws_iam_policy" "bucket_encryption_policy" {
  name   = "${local.bucket_name}-requires-encryption"
  path   = "/s3/${local.bucket_name}/requires-encryption/"
  policy = "${data.aws_iam_policy_document.require_encryption.json}"
}
