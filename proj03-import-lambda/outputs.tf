output "lambda_url" {
  value       = aws_lambda_function_url.hello_world_test.function_url
  description = "The URL of the Lambda function."
}