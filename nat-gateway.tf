# create a NAT Gateway for the VPC
resource "aws_nat_gateway" "terra_nat_gw" {
  allocation_id = aws_eip.terra_eip.id
  subnet_id     = aws_subnet.public.id

  depends_on = [aws_internet_gateway.terra_igw]

  tags = {
    Name = "terra-nat-gateway"
  }
}
