resource "aws_instance" "dev4" {
  ami = "ami-08d4ac5b634553e16"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags =  {
    Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.ssh-acess.id}"]
  depends_on = [
    aws_s3_bucket.dev4
  ]
}
// Na AWS O BUCKET É MULTIREGIONAL
resource "aws_s3_bucket" "dev4" {
  bucket = "hmlbucketdev4"
  acl = "private"
  tags = {
    Name = "hmlbucketdev4"
  }
}
