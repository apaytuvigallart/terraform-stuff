# import {
#   to = aws_s3_bucket_public_access_block.remote_state
#   id = aws_s3_bucket.remote_state.bucket
# }

# terraform import aws_s3_bucket.remote_state 'my-test-bucket-terraform-123'
# resource "aws_s3_bucket" "remote_state" {
#   bucket = "my-test-bucket-terraform-123"
#   region = "us-east-1"
#   tags = {
#     tag_1 = "value_1"
#     tag_2 = "value_2"
#   }
# }

# resource "aws_s3_bucket_public_access_block" "remote_state" {
#   bucket                  = aws_s3_bucket.remote_state.bucket
#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }