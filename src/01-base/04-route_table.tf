// =============================================================================
// DMZ
// =============================================================================
module "route_dmz" {
  source     = "../../modules/vpc/route_table"
  vpc_id     = module.vpc.id
  project    = local.project
  env        = var.env
  subnet_ids = module.subnet_dmz.ids
  tier       = "dmz"
}

resource "aws_route" "route_dmz_internet_gw" {
  route_table_id         = module.route_dmz.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = module.igw.id
}

// =============================================================================
// Web
// =============================================================================
module "route_web" {
  source     = "../../modules/vpc/route_table"
  vpc_id     = module.vpc.id
  project    = local.project
  env        = var.env
  subnet_ids = module.subnet_web.ids
  tier       = "web"
}

resource "aws_route" "route_web_nat_instance" {
  route_table_id         = module.route_web.id
  destination_cidr_block = "0.0.0.0/0"

  instance_id = module.nat_instance.id
}

// =============================================================================
// App
// =============================================================================
module "route_app" {
  source     = "../../modules/vpc/route_table"
  vpc_id     = module.vpc.id
  project    = local.project
  env        = var.env
  subnet_ids = module.subnet_app.ids
  tier       = "app"
}

resource "aws_route" "route_app_nat_instance" {
  route_table_id         = module.route_app.id
  destination_cidr_block = "0.0.0.0/0"

  instance_id = module.nat_instance.id
}

// =============================================================================
// Db
// =============================================================================
module "route_db" {
  source     = "../../modules/vpc/route_table"
  vpc_id     = module.vpc.id
  project    = local.project
  env        = var.env
  subnet_ids = module.subnet_db.ids
  tier       = "db"
}

// =============================================================================
// Mgmt
// =============================================================================
# module "route_mgmt" {
#   source     = "../../modules/vpc/route_table"
#   vpc_id     = module.vpc.id
#   project    = local.project
#   env        = var.env
#   subnet_ids = module.subnet_mgmt.ids
#   tier       = "mgmt"
# }

# resource "aws_route" "route_mgmt_nat_instance" {
#   route_table_id         = module.route_mgmt.id
#   destination_cidr_block = "0.0.0.0/0"

#   instance_id = module.nat_instance.id
# }
