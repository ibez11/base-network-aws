// =============================================================================
// IGW
// =============================================================================
module igw {
  source = "../../modules/vpc/igw"

  project = local.project
  env     = var.env

  vpc_id = module.vpc.id
}

// =============================================================================
// NAT instance
// =============================================================================
module sg_dmz_nat {
  source = "../../modules/vpc/securitygroup"

  project     = local.project
  env         = var.env
  tier        = "dmz"
  purpose     = "nat"
  description = "Security group for nat instance"

  vpc_id = module.vpc.id
}

resource "aws_security_group_rule" sg_dmz_nat_ingress_allow_ssh_sg_dmz_bastion {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.sg_dmz_bastion.id
  description              = "allow ssh from sg_dmz_bastion"
  security_group_id        = module.sg_dmz_nat.id
}

resource "aws_security_group_rule" sg_dmz_nat_ingress_allow_all_traffic_web {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = module.sg_web.id
  security_group_id        = module.sg_dmz_nat.id
  description              = "To allow allow traffic from web tier"
}

resource "aws_security_group_rule" sg_dmz_nat_ingress_allow_all_traffic_app {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = module.sg_app.id
  security_group_id        = module.sg_dmz_nat.id
  description              = "To allow allow traffic from app tier"
}

resource "aws_security_group_rule" sg_dmz_nat_egress_allow_all {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.sg_dmz_nat.id
}

module nat_instance {
  source = "../../modules/ec2"

  project = local.project
  env     = var.env
  purpose = "nat"
  tier    = "dmz"

  vpc_id                  = module.vpc.id
  ami                     = data.aws_ami.amazon_vpc_nat.id
  instance_type           = var.nat_instance_type
  key_name                = var.nat_key_name
  availability_zone       = local.az_list[0]
  iam_instance_profile_id = ""
  subnet_id               = module.subnet_dmz.ids[0]
  security_group_ids      = [module.sg_vpc.id, module.sg_dmz.id, module.sg_dmz_nat.id]
  source_dest_check       = false
}
