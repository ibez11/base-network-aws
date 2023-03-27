resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = merge(map(
          "Name", format("igw-%[1]s-%[2]s",var.project,var.env),
          "Project-Code", var.project,
          "Environment", var.env,
          "Terraform", true
        ), var.custom_tags)
}
