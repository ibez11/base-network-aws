// =============================================================================
// Bastion instance
// =============================================================================
module sg_dmz_bastion {
  source = "../../modules/vpc/securitygroup"

  project     = local.project
  env         = var.env
  tier        = "dmz"
  purpose     = "bastion"
  description = "Security group for bastion instance"

  vpc_id = module.vpc.id
}

resource "aws_security_group_rule" sg_dmz_bastion_ingress_allow_ssh {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.bastion_whitelisted_ip
  description       = "allow ssh"
  security_group_id = module.sg_dmz_bastion.id
}

resource "aws_security_group_rule" sg_dmz_bastion_egress_allow_all {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.sg_dmz_bastion.id
}

module bastion_instance {
  source = "../../modules/ec2"

  project = local.project
  env     = var.env
  purpose = "bastion"
  tier    = "dmz"

  vpc_id                  = module.vpc.id
  ami                     = data.aws_ami.amazon_linux_2.id
  instance_type           = var.bastion_instance_type
  key_name                = var.bastion_key_name
  availability_zone       = local.az_list[0]
  iam_instance_profile_id = ""
  subnet_id               = module.subnet_dmz.ids[0]
  security_group_ids      = [module.sg_vpc.id, module.sg_dmz.id, module.sg_dmz_bastion.id]
  source_dest_check       = false
}
