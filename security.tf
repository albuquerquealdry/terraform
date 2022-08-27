// PRINCIPAL SECURITY GROUP
resource "aws_security_group" "ssh-acess" {
  name        = "ssh-acess"
  description = "ssh-acess"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["177.37.174.144/32"]
  }

  tags = {
    Name = "shh"
  }
}
// SECOUND SECURITY GROUP
resource "aws_security_group" "ssh-acess-secound" {
  provider = "aws.secound"
  name        = "ssh-acess-secound"
  description = "ssh-acess-secound"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["177.37.174.144/32"]
  }

  tags = {
    Name = "shh"
  }
}