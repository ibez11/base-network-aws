resource "aws_instance" "ec2" {
  ami                  = var.ami
  instance_type        = var.instance_type
  key_name             = var.key_name
  availability_zone    = var.availability_zone
  iam_instance_profile = var.iam_instance_profile_id
  ebs_optimized        = true

  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  user_data = var.user_data
  source_dest_check = var.source_dest_check

  tags = merge(map(
        "Name", format("ec2-%[1]s-%[2]s-%[3]s-%[4]s", var.project, var.env, var.tier, var.purpose),
        "Project", var.project,
        "Environment", var.env,
        "Tier", var.tier,
        "Terraform", true
      ), var.custom_tags)

  volume_tags = merge(map(
        "Name", format("ebs-%[1]s-%[2]s-%[3]s-%[4]s", var.project, var.env, var.tier, var.purpose),
        "Project", var.project,
        "Environment", var.env,
        "Tier", var.tier,
        "Terraform", true
      ), var.custom_tags)
}
