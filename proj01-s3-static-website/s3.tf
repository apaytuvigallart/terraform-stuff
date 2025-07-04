resource "aws_s3_bucket" "website_test_bucket" {
  bucket = "proj01-s3-static-website-test-bucket"
  tags = merge(local.common_tags, {
    Name = "proj01-s3-static-website-test-bucket"
  })
}

resource "aws_s3_bucket_public_access_block" "enable_public_access" {
  bucket                  = aws_s3_bucket.website_test_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_getObject_anyone" {
  bucket = aws_s3_bucket.website_test_bucket.id
  policy = data.aws_iam_policy_document.allow_getObject_anyone.json
}

data "aws_iam_policy_document" "allow_getObject_anyone" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.website_test_bucket.arn}/*"]
  }
}

resource "aws_s3_bucket_website_configuration" "website_test_bucket_configuration" {
  bucket = aws_s3_bucket.website_test_bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "index_html_object" {
  bucket       = aws_s3_bucket.website_test_bucket.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
  etag         = filemd5("index.html")
}

resource "aws_s3_object" "error_html_object" {
  bucket       = aws_s3_bucket.website_test_bucket.id
  key          = "error.html"
  source       = "error.html"
  content_type = "text/html"
  etag         = filemd5("error.html")
}
