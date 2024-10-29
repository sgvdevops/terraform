# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a new EC2 instance
resource "aws_instance" "vm-1" {
  ami             = "ami-0c94855ba95c71c99"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.sg.name]

  # Add a tag to the instance
  tags = {
    Name = "tf-ec2-instance"
  }
}

# Create a new security group for the EC2 instance
resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow inbound traffic on port 22, 80, and 443"

  # Allow inbound traffic on port 22 (SSH)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound traffic on port 80 (HTTP)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound traffic on port 80 (HTTPS)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}