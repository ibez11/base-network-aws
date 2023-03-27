variable "env" {
  type = string
  description = "dev, prd"
}

variable "project" {
  type = string
  description = "The name of the project"
}

variable "tier" {
  type = string
  description = "The tier of this instance"
}

variable "purpose" {
  type = string
  description = "The purpose of this instance"
}

variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "custom_tags" {
  description = "Extra custom tags on top of the default gcc required tags"
  default = {}
}

variable "ami" {
  type = string
  description = "The ami of the instance"
}

variable "instance_type" {
  type = string
  description = "The instance type of the instance"
  default = "t3.micro"
}

variable key_name {
  type = string
  description = "The key-pair name"
}

variable availability_zone {
  type = string
  description = "The az to launch the instance in"
}

variable iam_instance_profile_id {
  type = string
  description = "The id of iam instance profile"
}

variable subnet_id {
  type = string
  description = "The id of the subnet to launch in"
}

variable security_group_ids {
  type = list(string)
  description = "The ids of the security groups"
}

variable user_data {
  default = ""
}

variable source_dest_check {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true."
  default = true
}
