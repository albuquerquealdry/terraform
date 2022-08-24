provider "aws" {
    version = "~> 2.0"
    region = "us-east-1"
}

resource "aws_instance" "dev" {
  count = 3  
  ami = "ami-08d4ac5b634553e16"
  instance_type = "t2.micro"
  key_name = "JAMÉ DEIXAREI"
  tags =  {
    Name = "dev${count.index}"
  }
}