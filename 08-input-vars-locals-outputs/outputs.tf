output "aws_s3_bucket_name" {
  description = "The name of the S3 bucket created"
  value       = aws_s3_bucket.my_fantastic_bucket.bucket
  sensitive   = true
}

output "my_sensitive_var" {
  value     = var.my_sensitive_var
  sensitive = true
}