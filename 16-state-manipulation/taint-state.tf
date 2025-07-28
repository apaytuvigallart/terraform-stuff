resource "aws_s3_bucket" "taint_state" {
  bucket = "taint-state-bucket-123"
}

resource "aws_s3_bucket_public_access_block" "taint_state" {
  bucket                  = aws_s3_bucket.taint_state.bucket
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = true

}

resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "this" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.1.0/24"
}