
variable "vpc_id" {
  description = "id for vpc"
}

variable "env" {
  description = "dev, prd"
}

variable "tier" {
  description = "name of the Tier"
}

variable "purpose" {
  description = "purpose of the security group"
}

variable "project" {
  description = "project code"
}

variable "description" {
  description = "description for Security Group"
}

variable "custom_tags" {
  description = "Extra custom tags on top of the default gcc required tags"
  default = {}
}
