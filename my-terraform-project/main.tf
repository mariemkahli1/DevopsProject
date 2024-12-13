provider "aws" {
  region = "us-east-1"
}

provider "tls" {}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 3.0"
    }
  }
}

# VPC and Networking resources remain unchanged
# Ensure variable names match in your `variables.tf` and values in `terraform.tfvars`

output "instance_public_ip" {
  value = aws_instance.public_instance.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.mydb.endpoint
}

output "deployer_key_s3_uri" {
  value = aws_s3_bucket_object.private_key_object.bucket + "/" + aws_s3_bucket_object.private_key_object.key
}
