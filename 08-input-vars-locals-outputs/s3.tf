resource "random_id" "bucket_suffix" {
  byte_length = 4

}
resource "aws_s3_bucket" "my_fantastic_bucket" {
  bucket = "${local.common_tags.project}-${random_id.bucket_suffix.hex}"
  tags = merge(
    local.common_tags,
    var.additional_tags,
  )
}