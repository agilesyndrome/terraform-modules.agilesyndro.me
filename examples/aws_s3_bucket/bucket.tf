module "s3_bucket" {
  source      = "../../modules/aws_s3_bucket"
  bucket_name = "agilesyndrome-terraformtest-s3bucket"
}

module "s3_bucket_fromgit" {
  source      = "github.com/agilesyndrome/terraform-modules.agilesyndro.me.git/?ref=v0.0.1/modules/s3_bucket"
  bucket_name = "agilesyndrome-terraformtest-s3bucket"
}
