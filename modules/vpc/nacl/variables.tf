variable "env" {
  description = "dev, prd"
}

variable "tier" {
  description = "dmz, web, app, db, mgmt"
}

variable "project" {
  description = "The name of the project"
}

variable nacl_rules {
  type = list(object({
    rule_number = number,
    egress = bool,
    protocol = string,
    from_port = number,
    to_port = number,
    cidr_block = string,
    rule_action = string
  }))
  description = "List of NACL Rules object"
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
