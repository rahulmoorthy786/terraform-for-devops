terraform {
  required_version = ">= 1.15.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.57.1"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "backend-s3-tfstate-bucket-2026"
    key    = "terraform-for-devops/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true

    encrypt = true

  }
}
