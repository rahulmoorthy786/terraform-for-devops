# Attach Elastic IP to the NAT Gateway

resource "aws_eip" "terra_eip" {
  domain = "vpc"

  tags = {
    Name = "terra-eip"
  }

}
