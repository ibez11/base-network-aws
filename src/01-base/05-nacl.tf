// =============================================================================
// DMZ
// =============================================================================
module nacl_dmz {
  source = "../../modules/vpc/nacl"

  project = local.project
  env     = var.env
  tier    = "dmz"

  vpc_id     = module.vpc.id
  subnet_ids = module.subnet_dmz.ids

  nacl_rules = [
    {
      rule_number = 1999
      egress      = true
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_block  = "0.0.0.0/0"
      rule_action = "allow"
    },
    {
      rule_number = 1999
      egress      = false
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_block  = "0.0.0.0/0"
      rule_action = "allow"
    },
  ]
}

// =============================================================================
// Web
// =============================================================================
module nacl_web {
  source = "../../modules/vpc/nacl"

  project = local.project
  env     = var.env
  tier    = "web"

  vpc_id     = module.vpc.id
  subnet_ids = module.subnet_web.ids

  nacl_rules = [
    {
      rule_number = 1100
      egress      = true
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_block  = module.subnet_db.cidr_blocks[0]
      rule_action = "deny"
    },
    {
      rule_number = 1101
      egress      = true
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_block  = module.subnet_db.cidr_blocks[1]
      rule_action = "deny"
    },
    {
      rule_number = 1999
      egress      = true
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_block  = "0.0.0.0/0"
      rule_action = "allow"
    },
    {
      rule_number = 1100
      egress      = false
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_block  = module.subnet_db.cidr_blocks[0]
      rule_action = "deny"
    },
    {
      rule_number = 1101
      egress      = false
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_block  = module.subnet_db.cidr_blocks[1]
      rule_action = "deny"
    },
    {
      rule_number = 1999
      egress      = false
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_block  = "0.0.0.0/0"
      rule_action = "allow"
    },
  ]
}

// =============================================================================
// App
// =============================================================================
module nacl_app {
  source = "../../modules/vpc/nacl"

  project = local.project
  env     = var.env
  tier    = "app"

  vpc_id     = module.vpc.id
  subnet_ids = module.subnet_app.ids

  nacl_rules = [
    {
      rule_number = 1999
      egress      = true
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_block  = "0.0.0.0/0"
      rule_action = "allow"
    },
    {
      rule_number = 1999
      egress      = false
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_block  = "0.0.0.0/0"
      rule_action = "allow"
    },
  ]
}

// =============================================================================
// Db
// =============================================================================
module nacl_db {
  source = "../../modules/vpc/nacl"

  project = local.project
  env     = var.env
  tier    = "db"

  vpc_id     = module.vpc.id
  subnet_ids = module.subnet_db.ids

  nacl_rules = [
    {
      rule_number = 1200
      egress      = true
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_block  = module.subnet_web.cidr_blocks[0]
      rule_action = "deny"
    },
    {
      rule_number = 1201
      egress      = true
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_block  = module.subnet_web.cidr_blocks[1]
      rule_action = "deny"
    },
    {
      rule_number = 1999
      egress      = true
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_block  = "0.0.0.0/0"
      rule_action = "allow"
    },
    {
      rule_number = 1200
      egress      = false
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_block  = module.subnet_web.cidr_blocks[0]
      rule_action = "deny"
    },
    {
      rule_number = 1201
      egress      = false
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_block  = module.subnet_web.cidr_blocks[1]
      rule_action = "deny"
    },
    {
      rule_number = 1999
      egress      = false
      protocol    = "-1"
      from_port   = 0
      to_port     = 0
      cidr_block  = "0.0.0.0/0"
      rule_action = "allow"
    },
  ]
}

// =============================================================================
// Mgmt
// =============================================================================
# module nacl_mgmt {
#   source = "../../modules/vpc/nacl"

#   project = local.project
#   env     = var.env
#   tier    = "mgmt"

#   vpc_id     = module.vpc.id
#   subnet_ids = module.subnet_mgmt.ids

#   nacl_rules = [
#     {
#       rule_number = 1999
#       egress      = true
#       protocol    = "-1"
#       from_port   = 0
#       to_port     = 0
#       cidr_block  = "0.0.0.0/0"
#       rule_action = "allow"
#     },
#     {
#       rule_number = 1999
#       egress      = false
#       protocol    = "-1"
#       from_port   = 0
#       to_port     = 0
#       cidr_block  = "0.0.0.0/0"
#       rule_action = "allow"
#     },
#   ]
# }
