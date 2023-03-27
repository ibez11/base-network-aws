################################################################################
# Route Module
################################################################################
resource "aws_route_table" "route_table" {

  vpc_id = var.vpc_id

  tags = merge(map(
          "Name", format("rt-%[1]s-%[2]s-%[3]s",var.project,var.env,var.tier),
          "Project-Code", var.project,
          "Environment", var.env,
          "Tier", var.tier,
          "Terraform", true
        ), var.custom_tags)
}

resource "aws_route_table_association" "route_table_association" {
  count = length(var.subnet_ids)

  subnet_id      = var.subnet_ids[count.index]
  route_table_id = aws_route_table.route_table.id
}
