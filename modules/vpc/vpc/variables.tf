variable "env" {
  description = "prd, dev"
}

variable "project" {
  description = "The name of the project"
}

variable "custom_tags" {
  description = "Extra custom tags on top of the default tags"
  default = {}
}

variable "cidr_block" {
  description = "The CIDR block for the VPC."
  default = "10.0.0.0/16"
}
