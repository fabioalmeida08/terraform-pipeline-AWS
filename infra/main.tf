module "s3" {
  source = "./s3"
  bucket_name = var.bucket_name
  env_name = var.env_name
}