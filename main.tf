provider "aws"{
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket = "${BUCKET_TF_STATE}"
    key    = "terraform.tfstate"
    region = "${AWS_REGION}"
  }
}
resource "aws_ecr_repository" "foo" {
  name                 = "bar"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

