data "aws_caller_identity" "current_identity" {}
data "aws_region" "current_region" {}
data "aws_region" "current_region_us_east_1" {
  provider = aws.us-east-1
}
data "aws_vpc" "console_managed" {
  tags = {
    Env = "Prod"
  }
}

data "aws_iam_policy_document" "read_access" {
  statement {
    sid = "PublicReadGetObject"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions = [
      "s3:GetObject"
    ]
    resources = ["arn:aws:s3:::*/*"]
  }
}