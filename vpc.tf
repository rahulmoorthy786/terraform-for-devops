resource "aws_vpc" "terra_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true # Enable DNS hostnames for the VPC. Disabled by default you must enable this option.
  enable_dns_support   = true # Enable DNS support for the VPC.


  tags = {
    Name = "terra-vpc"
  }

}
