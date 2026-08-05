variable "ec2_instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "ec2_root_storage_size" {
  description = "The instance size for the Ec2 instance"
  type        = number
  default     = 25
}
