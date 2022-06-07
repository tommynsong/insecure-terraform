resource "aws_s3_bucket" "tsong-test-bucket" {
  # checkov:skip=BC_AWS_NETWORKING_52: ADD REASON
  # checkov:skip=BC_AWS_GENERAL_72: ADD REASON
  # checkov:skip=BC_AWS_GENERAL_56: ADD REASON
  bucket = "239780908821-some-random-bucket-name"
  tags = {
    yor_trace = "8b49cbaf-bf71-4c47-be34-2a6b90d81cb2"
  }
}

resource "aws_s3_bucket" "tsong-test-bucket_log_bucket" {
  # checkov:skip=BC_AWS_GENERAL_56: ADD REASON
  # checkov:skip=BC_AWS_NETWORKING_52: ADD REASON
  # checkov:skip=BC_AWS_GENERAL_72: ADD REASON
  # checkov:skip=BC_AWS_S3_16: ADD REASON
  # checkov:skip=BC_AWS_S3_14: ADD REASON
  bucket = "239780908821-tsong-test-bucket-log-bucket"
  tags = {
    yor_trace = "f62a3dcc-c00b-4f73-8cba-80ca6f8d0969"
  }
}

resource "aws_s3_bucket_logging" "tsong-test-bucket" {
  bucket = aws_s3_bucket.tsong-test-bucket.id

  target_bucket = aws_s3_bucket.tsong-test-bucket_log_bucket.id
  target_prefix = "log/"
}

resource "aws_s3_bucket_versioning" "tsong-test-bucket" {
  bucket = aws_s3_bucket.tsong-test-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tsong-test-bucket" {
  bucket = aws_s3_bucket.tsong-test-bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
