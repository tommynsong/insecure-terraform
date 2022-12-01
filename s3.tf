resource "aws_s3_bucket" "bucket" {
  bucket        = "239780908821-some-rando-bucket-name"
  force_destroy = true
  tags = {
    git_repo             = "insecure-terraform"
    yor_trace            = "8b49cbaf-bf71-4c47-be34-2a6b90d81cb2"
    git_commit           = "3e03623c43964383856e649cfe301197eaab8f9a"
    git_file             = "s3.tf"
    git_last_modified_at = "2022-06-07 21:45:10"
    git_last_modified_by = "tommynsong@gmail.com"
    git_modifiers        = "tommynsong"
    git_org              = "tommynsong"
  }
}
# resource "aws_s3_bucket_server_side_encryption_configuration" "bucket" {
#   bucket = aws_s3_bucket.bucket.id

#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "aws:kms"
#     }
#   }
# }
# resource "aws_s3_bucket_logging" "bucket" {
#   bucket = aws_s3_bucket.bucket.id

#   target_bucket = aws_s3_bucket.logs.id
#   target_prefix = "log/"
# }
# resource "aws_s3_bucket_acl" "bucket" {
#   bucket = aws_s3_bucket.bucket.id
#   acl    = "private"
# }
# resource "aws_s3_bucket_public_access_block" "bucket" {
#   bucket = aws_s3_bucket.bucket.id

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }
# resource "aws_s3_bucket_versioning" "bucket" {
#   bucket = aws_s3_bucket.bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }
resource "aws_s3_bucket" "logs" {
  bucket        = "${aws_s3_bucket.bucket.id}-logs"
  force_destroy = true
  tags = {
    git_repo             = "insecure-terraform"
    yor_trace            = "f62a3dcc-c00b-4f73-8cba-80ca6f8d0969"
    git_commit           = "3e03623c43964383856e649cfe301197eaab8f9a"
    git_file             = "s3.tf"
    git_last_modified_at = "2022-06-07 21:45:10"
    git_last_modified_by = "tommynsong@gmail.com"
    git_modifiers        = "tommynsong"
    git_org              = "tommynsong"
  }
}

resource "aws_s3_bucket" "logs_log_bucket" {
  bucket = "logs-log-bucket"
}

resource "aws_s3_bucket_logging" "logs" {
  bucket = aws_s3_bucket.logs.id

  target_bucket = aws_s3_bucket.logs_log_bucket.id
  target_prefix = "log/"
}

# resource "aws_s3_bucket_acl" "logs" {
#   bucket = aws_s3_bucket.logs.id
#   acl    = "log-delivery-write"
# }
# resource "aws_s3_bucket_server_side_encryption_configuration" "logs" {
#   bucket = aws_s3_bucket.logs.id

#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "aws:kms"
#     }
#   }
# }
# resource "aws_s3_bucket_versioning" "logs" {
#   bucket = aws_s3_bucket.logs.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }
