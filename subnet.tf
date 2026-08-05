# Create a public subnet in the VPC

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.terra_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1a"
  }

}

# Create a private subnet in the VPC

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.terra_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-1a"
  }
}
