resource "aws_subnet" "subnets" {
  count                   = length(var.subnets_cidr)

  vpc_id                  = var.vpc_id
  map_public_ip_on_launch = var.auto_assign_public_ip
  cidr_block              = var.subnets_cidr[count.index]
  availability_zone       = var.az_list[count.index]

  tags = merge(map(
          "Name", format("sub-%[1]s-%[2]s-%[3]s-%[4]s-%[5]s",var.project,var.env,var.tier, var.purpose, substr(var.az_list[count.index],length(var.az_list[count.index])-1,length(var.az_list[count.index]))),
          "Project-Code", var.project,
          "Environment", var.env,
          "Tier", var.tier,
          "Terraform", true
        ), var.custom_tags)
}
