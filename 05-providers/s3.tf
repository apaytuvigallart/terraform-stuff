resource "aws_s3_bucket" "us_west_bucket" {
  bucket = "my-us-west-test-bucket"

  tags = {
    Name = "My US West bucket"
  }
}

resource "aws_s3_bucket" "us_east_bucket" {
  bucket   = "my-us-east-test-bucket"
  provider = aws.us-east
  tags = {
    Name = "My US East bucket"
  }
}