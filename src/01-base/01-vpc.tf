module vpc {
  source = "../../modules/vpc/vpc"

  project = local.project
  env     = var.env

  cidr_block = var.cidr_block
}
