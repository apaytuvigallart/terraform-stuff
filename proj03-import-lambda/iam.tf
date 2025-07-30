import {
  to = aws_iam_role.lambda_execution_role
  id = "hello_world_test-role-6cvrfdcc"
}

import {
  to = aws_iam_policy.lambda_execution
  id = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/service-role/AWSLambdaBasicExecutionRole-3e017945-5817-407e-a8ba-079c38343f03"
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_iam_policy_document" "assume_lambda_execution_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "lambda_execution" {
  statement {
    resources = ["arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:*"]
    actions   = ["logs:CreateLogGroup"]
  }
  statement {
    resources = ["${aws_cloudwatch_log_group.lambda.arn}:*"]
    actions   = ["logs:CreateLogStream", "logs:PutLogEvents"]
  }
}

resource "aws_iam_policy" "lambda_execution" {
  description = null
  name        = "AWSLambdaBasicExecutionRole-3e017945-5817-407e-a8ba-079c38343f03"
  name_prefix = null
  path        = "/service-role/"
  policy      = data.aws_iam_policy_document.lambda_execution.json
  tags        = {}
  tags_all    = {}
}

resource "aws_iam_role" "lambda_execution_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_lambda_execution_role.json
  name               = "hello_world_test-role-6cvrfdcc"
  path               = "/service-role/"
}

resource "aws_iam_role_policy_attachment" "lambda_execution" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = aws_iam_policy.lambda_execution.arn
}