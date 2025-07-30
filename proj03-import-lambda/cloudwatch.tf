import {
  to = aws_cloudwatch_log_group.lambda
  id = "/aws/lambda/hello_world_test"
}

resource "aws_cloudwatch_log_group" "lambda" {
  name = "/aws/lambda/hello_world_test"
}
