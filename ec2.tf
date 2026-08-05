# key for ec2 instance

resource "aws_key_pair" "terra_key" {
  key_name   = "terra-key"
  public_key = file("terra-key.pub")
}

resource "aws_instance" "public_ec2" {
  ami                         = data.aws_ami.ubuntu.id # Instance will use the latest Ubuntu AMI from Canonical
  instance_type               = var.ec2_instance_type
  key_name                    = aws_key_pair.terra_key.key_name
  vpc_security_group_ids      = [aws_security_group.terra_sg.id]
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true


  root_block_device {
    volume_size = var.ec2_root_storage_size
    volume_type = "gp3"
  }

  tags = {
    Name = "terra-public-ec2"
  }
}

resource "aws_instance" "private_ec2" {
  ami                    = data.aws_ami.ubuntu.id # Instance will use the latest Ubuntu AMI from Canonical
  instance_type          = var.ec2_instance_type
  key_name               = aws_key_pair.terra_key.key_name
  vpc_security_group_ids = [aws_security_group.terra_sg.id]
  subnet_id              = aws_subnet.private.id

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y python3
              EOF


  root_block_device {
    volume_size = var.ec2_root_storage_size
    volume_type = "gp3"
  }

  tags = {
    Name = "terra-private-ec2"
  }
}
