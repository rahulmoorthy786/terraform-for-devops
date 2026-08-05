output "public_instance_public_ip" {
  value       = aws_instance.public_ec2.public_ip
  description = "The public IP address of the EC2 instance"
}

output "public_instance_private_ip" {
  value       = aws_instance.public_ec2.private_ip
  description = "The private IP address of public Ec2 instance"
}


output "private_instance_private_ip" {
  value       = aws_instance.private_ec2.private_ip
  description = "The private IP address of the EC2 instance"
}

output "aws_public-dns" {
  value       = aws_instance.public_ec2.public_dns
  description = "The public DNS of the EC2 instance"
}

output "aws_ami_id" {
  value       = aws_instance.public_ec2.ami
  description = "The AMI ID of the EC2 instance"
}
