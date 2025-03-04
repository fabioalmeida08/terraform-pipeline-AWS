resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  tags = {
    Environment = var.env_name
    Project     = "TerraformPipeline"
  }
}