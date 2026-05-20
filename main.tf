provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "terraform_sg" {
  name        = "terraform-sg"
  description = "Allow SSH and Flask app"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "terraform_ec2" {
  ami                    = "ami-03f4878755434977f"
  instance_type          = "t3.micro"
  key_name               = "terraform-key"
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]

  tags = {
    Name = "Terraform-EC2"
  }
}
