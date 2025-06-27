resource "random_id" "bucket_id" {
  byte_length = 12
  prefix      = "tf-bucket-"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = random_id.bucket_id.hex
  tags = {
    Name = "Terraform S3 Bucket"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}