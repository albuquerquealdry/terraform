// ****PROVIDERS*****

// PRINCIPAL RESOURCE
provider "aws" {
  region                      = "us-east-1"
  access_key                  = "foo"
  secret_key                  = "bar"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  endpoints {
    apigateway     = "http://localhost:4566"
    cloudformation = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    es             = "http://localhost:4566"
    ec2            = "http://localhost:4566"
    firehose       = "http://localhost:4566"
    iam            = "http://localhost:4566"
    kinesis        = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    route53        = "http://localhost:4566"
    redshift       = "http://localhost:4566"
    s3             = "http://localhost:4566"
    secretsmanager = "http://localhost:4566"
    ses            = "http://localhost:4566"
    sns            = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    ssm            = "http://localhost:4566"
    stepfunctions  = "http://localhost:4566"
    sts            = "http://localhost:4566"
  }
}

// SECOUND RESOURCE
provider "aws" {
    alias = "secound"
    region = "us-east-2"
    access_key                  = "foo"
    secret_key                  = "bar"
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    endpoints {
      apigateway     = "http://localhost:4566"
      cloudformation = "http://localhost:4566"
      cloudwatch     = "http://localhost:4566"
      dynamodb       = "http://localhost:4566"
      es             = "http://localhost:4566"
      ec2            = "http://localhost:4566"
      firehose       = "http://localhost:4566"
      iam            = "http://localhost:4566"
      kinesis        = "http://localhost:4566"
      lambda         = "http://localhost:4566"
      route53        = "http://localhost:4566"
      redshift       = "http://localhost:4566"
      s3             = "http://localhost:4566"
      secretsmanager = "http://localhost:4566"
      ses            = "http://localhost:4566"
      sns            = "http://localhost:4566"
      sqs            = "http://localhost:4566"
      ssm            = "http://localhost:4566"
      stepfunctions  = "http://localhost:4566"
      sts            = "http://localhost:4566"
  }
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