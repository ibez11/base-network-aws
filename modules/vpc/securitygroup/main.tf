resource "aws_security_group" "sgrp" {
  name        = format("sgrp-%[1]s-%[2]s-%[3]s-%[4]s",var.project,var.env,var.tier,var.purpose)
  description = var.description
  vpc_id      = var.vpc_id

  tags = merge(map(
          "Name", format("sgrp-%[1]s-%[2]s-%[3]s-%[4]s",var.project,var.env,var.tier,var.purpose),
          "Project-Code", var.project,
          "Environment", var.env,
          "Tier", var.tier,
          "Purpose", var.purpose,
          "Terraform", true
        ), var.custom_tags)
}
