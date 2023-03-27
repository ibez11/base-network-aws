################################################################################
# NACL Module
################################################################################
resource "aws_network_acl" "nacl" {
  vpc_id= var.vpc_id
  subnet_ids = var.subnet_ids
  tags = merge(map(
          "Name", format("nacl-%[1]s-%[2]s-%[3]s",var.project,var.env,var.tier),
          "Project-Code", var.project,
          "Environment", var.env,
          "Tier", var.tier,
          "Terraform", true
        ), var.custom_tags)
}

resource "aws_network_acl_rule" "nacl_rule" {
  count             = length(var.nacl_rules)
  rule_number       = var.nacl_rules[count.index].rule_number
  network_acl_id    = aws_network_acl.nacl.id
  egress            = var.nacl_rules[count.index].egress
  protocol          = var.nacl_rules[count.index].protocol
  from_port         = var.nacl_rules[count.index].from_port
  to_port           = var.nacl_rules[count.index].to_port
  cidr_block        = var.nacl_rules[count.index].cidr_block
  rule_action       = var.nacl_rules[count.index].rule_action
}

