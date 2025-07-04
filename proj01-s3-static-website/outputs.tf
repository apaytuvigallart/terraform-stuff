output "website_url" {
  value       = aws_s3_bucket_website_configuration.website_test_bucket_configuration.website_endpoint
  description = "The URL of the S3 static website"
}