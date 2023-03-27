// =============================================================================
// DMZ
// =============================================================================
module subnet_dmz {
  source = "../../modules/vpc/subnet"

  project = local.project
  env     = var.env
  tier    = "dmz"
  purpose = "public"

  vpc_id = module.vpc.id

  az_list               = local.az_list
  subnets_cidr          = var.dmz_cidr_block
  auto_assign_public_ip = true
}

// =============================================================================
// Web
// =============================================================================
module subnet_web {
  source = "../../modules/vpc/subnet"

  project = local.project
  env     = var.env
  tier    = "web"
  purpose = "private"

  vpc_id = module.vpc.id

  az_list               = local.az_list
  subnets_cidr          = var.web_cidr_block
  auto_assign_public_ip = false
}

// =============================================================================
// App
// =============================================================================
module subnet_app {
  source = "../../modules/vpc/subnet"

  project = local.project
  env     = var.env
  tier    = "app"
  purpose = "private"

  vpc_id = module.vpc.id

  az_list               = local.az_list
  subnets_cidr          = var.app_cidr_block
  auto_assign_public_ip = false
}

// =============================================================================
// DB
// =============================================================================
module subnet_db {
  source = "../../modules/vpc/subnet"

  project = local.project
  env     = var.env
  tier    = "db"
  purpose = "private"

  vpc_id = module.vpc.id

  az_list               = local.az_list
  subnets_cidr          = var.db_cidr_block
  auto_assign_public_ip = false
}

// =============================================================================
// Mgmt
// =============================================================================
# module subnet_mgmt {
#   source = "../../modules/vpc/subnet"

#   project = local.project
#   env     = var.env
#   tier    = "mgmt"
#   purpose = "private"

#   vpc_id = module.vpc.id

#   az_list               = local.az_list
#   subnets_cidr          = var.mgmt_cidr_block
#   auto_assign_public_ip = false
# }
