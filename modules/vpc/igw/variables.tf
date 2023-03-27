variable "env" {
  description = "dev, prd"
}

variable "project" {
  description = "The name of the project"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "custom_tags" {
  description = "Extra custom tags on top of the default gcc required tags"
  default = {}
}
