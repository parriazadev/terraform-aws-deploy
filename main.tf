provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c574c8" # This is an example Amazon Linux 2 AMI ID. Replace with the AMI ID you want to use.
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}