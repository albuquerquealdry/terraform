// ****PROVIDERS*****

// PRINCIPAL RESOURCE
provider "aws" {
    version = "~> 2.0"
    region = "us-east-1"
}

// SECOUND RESOURCE
provider "aws" {
    alias = "secound"
    version = "~> 2.0"
    region = "us-east-2"
}

// INSTACES PRINCIAL
resource "aws_instance" "dev" {
  count = 3  
  ami = "ami-08d4ac5b634553e16"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags =  {
    Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.ssh-acess.id}"]
}

// INSTACES SECOUND
resource "aws_instance" "dev-secound" {
  provider = "aws.secound"
  count = 3  
  ami = "ami-02f3416038bdb17fb"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags =  {
    Name = "dev-secound${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.ssh-acess-secound.id}"]
}