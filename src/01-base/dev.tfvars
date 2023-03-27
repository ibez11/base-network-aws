// =============================================================================
// Credentials
// =============================================================================
aws_access_key = ""
aws_secret_key = ""

// =============================================================================
// Overall
// =============================================================================
env = "dev"

// =============================================================================
// VPC
// =============================================================================
cidr_block = "20.0.0.0/23"

// =============================================================================
// Subnets
// =============================================================================
dmz_cidr_block = ["20.0.1.192/27", "20.0.1.224/27"]
web_cidr_block = ["20.0.0.0/26", "20.0.0.64/26"]
app_cidr_block = ["20.0.0.128/26", "20.0.0.192/26"]
db_cidr_block = ["20.0.1.0/26", "20.0.1.64/26"]

// =============================================================================
// NAT Instance
// =============================================================================
nat_instance_type = "t3.micro"
nat_key_name = "key-project-dev-nat"

// =============================================================================
// Bastion Instance
// =============================================================================
bastion_instance_type = "t3.micro"
bastion_key_name = "key-project-dev-bastion"
// ibez: 125.165.110.14
bastion_whitelisted_ip = ["125.165.110.14/32"]