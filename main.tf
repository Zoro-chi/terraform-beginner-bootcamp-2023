# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "terraform_website_bucket" {
  bucket = var.bucket_name

  tags = {
    UserUuid = var.user_uuid
  }
}

