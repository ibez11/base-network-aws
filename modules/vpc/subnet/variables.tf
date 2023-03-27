variable "env" {
  description = "dev, prd"
}

variable "tier" {
  description = "dmz, web, app, db, mgmt"
}

variable "project" {
  description = "The name of project"
}

variable "purpose" {
  type = string
  description = "public, private"

  validation {
    condition     = var.purpose == "public" || var.purpose == "private"
    error_message = "Purpose must be either public or private."
  }
}

# Variable for availibility zones
variable "az_list" {
  description = "Define the number of AZ for each subnet block"
  type = list(string)
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "auto_assign_public_ip" {
  description = "Indicates whether to auto-assign public ip"
  type = string
  default = "false"
}

# Variable for cidr range for subnets
variable "subnets_cidr" {
  description = "List of cidr ranges to be used in the subnets creation"
  type = list(string)
}

# Variable for vpc id
variable "vpc_id" {
  description = "VPC ID"
}

variable "custom_tags" {
  description = "Extra custom tags on top of the default gcc required tags"
  default = {}
}
