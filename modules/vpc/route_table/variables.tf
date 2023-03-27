variable "env" {
  description = "dev, prd"
}

variable "tier" {
  description = "dmz, web, app, db, mgmt"
}

variable "project" {
  description = "The name of the project"
}

# Variable for vpc id
variable "vpc_id" {
  description = "VPC ID"
}

variable "subnet_ids" {
  description = "List of subnet ids"
  type = list(string)
}

variable "custom_tags" {
  description = "Extra custom tags on top of the default gcc required tags"
  default = {}
}
