removed {
  from = aws_s3_bucket.remove_state

  lifecycle {
    destroy = false
  }
}

# 1. create the bucket and comment out the resource block
# 2. terraform state rm aws_s3_bucket.remove_state => to remove the resource from state and stop tracking it
# 3. terraform import aws_s3_bucket.remove_state 'remove-state-bucket-123
# 4. Remove the resource from state by using the `removed` block

# resource "aws_s3_bucket" "remove_state" {
#     bucket = "remove-state-bucket-123"
# }