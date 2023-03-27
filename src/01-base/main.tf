// =============================================================================
// Versions
// =============================================================================
terraform {
  required_version = ">= 0.13"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    key = "01-base-network.tfstate"
  }
}

// =============================================================================
// Providers
// =============================================================================
provider aws {
  region  = local.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

// =============================================================================
// Local variables (Global)
// =============================================================================
locals {
  region  = "ap-southeast-1"
  project = "project"
  project_merchant = "merchant"
  az_list = ["ap-southeast-1a", "ap-southeast-1b"]
}

// =============================================================================
// Data
// =============================================================================
data "aws_ami" "amazon_linux_2" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}

data "aws_ami" "amazon_vpc_nat" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-vpc-nat-*"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}

data "aws_caller_identity" "current" {}
