// =============================================================================
// VPC
// =============================================================================
module sg_vpc {
  source = "../../modules/vpc/securitygroup"

  project     = local.project
  env         = var.env
  tier        = "vpc"
  purpose     = "vpc"
  description = "Security group for the whole of vpc"

  vpc_id = module.vpc.id
}

// =============================================================================
// DMZ
// =============================================================================
module sg_dmz {
  source = "../../modules/vpc/securitygroup"

  project     = local.project
  env         = var.env
  tier        = "dmz"
  purpose     = "dmz"
  description = "Security group for the whole of dmz"

  vpc_id = module.vpc.id
}

// =============================================================================
// Web
// =============================================================================
module sg_web {
  source = "../../modules/vpc/securitygroup"

  project     = local.project
  env         = var.env
  tier        = "web"
  purpose     = "web"
  description = "Security group for the whole of web"

  vpc_id = module.vpc.id
}

// =============================================================================
// App
// =============================================================================
module sg_app {
  source = "../../modules/vpc/securitygroup"

  project     = local.project
  env         = var.env
  tier        = "app"
  purpose     = "app"
  description = "Security group for the whole of app"

  vpc_id = module.vpc.id
}

// =============================================================================
// Db
// =============================================================================
module sg_db {
  source = "../../modules/vpc/securitygroup"

  project     = local.project
  env         = var.env
  tier        = "db"
  purpose     = "db"
  description = "Security group for the whole of db"

  vpc_id = module.vpc.id
}

// =============================================================================
// Mgmt
// =============================================================================
# module sg_mgmt {
#   source = "../../modules/vpc/securitygroup"

#   project     = local.project
#   env         = var.env
#   tier        = "mgmt"
#   purpose     = "mgmt"
#   description = "Security group for the whole of mgmt"

#   vpc_id = module.vpc.id
# }
