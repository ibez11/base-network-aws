resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(map(
    "Name", "vpc-${var.project}-${var.env}",
    "Project", var.project,
    "Environment", var.env,
    "Terraform", true
  ), var.custom_tags)
}
