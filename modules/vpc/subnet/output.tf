output "ids" {
  value       = aws_subnet.subnets.*.id
  description = "List of the web subnet's id"
}

output "cidr_blocks" {
  value = aws_subnet.subnets.*.cidr_block
  description = "CIDR Blocks"
}
