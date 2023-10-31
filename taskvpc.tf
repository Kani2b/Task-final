provider "aws" {
  region = "ap-south-1" 
}

resource "aws_vpc" "task_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.task_vpc.id
  cidr_block = "10.0.1.0/24"
}


resource "aws_instance" "task_ec2" {
  ami           = "ami-0287a05f0ef0e9d9a" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
}

output "task_ec2_ip" {
  value = aws_instance.task_ec2.public_ip
}
