import {
  to = aws_lambda_function.hello_world_test
  id = "hello_world_test"
}

data "archive_file" "lambda_code" {
  type        = "zip"
  source_file = "${path.root}/build/lambda_function.py"
  output_path = "${path.root}/build/lambda.zip"
}

resource "aws_lambda_function" "hello_world_test" {
  description      = "A starter AWS Lambda function."
  filename         = data.archive_file.lambda_code.output_path
  function_name    = "hello_world_test"
  handler          = "lambda_function.lambda_handler"
  role             = aws_iam_role.lambda_execution_role.arn
  runtime          = "python3.12"
  source_code_hash = data.archive_file.lambda_code.output_base64sha256
  tags = {
    "lambda-console:blueprint" = "hello-world-python"
  }
  tags_all = {
    "lambda-console:blueprint" = "hello-world-python"
  }
  logging_config {
    log_format = "Text"
    log_group  = aws_cloudwatch_log_group.lambda.name
  }
}

resource "aws_lambda_function_url" "hello_world_test" {
  function_name      = aws_lambda_function.hello_world_test.function_name
  authorization_type = "NONE"

}