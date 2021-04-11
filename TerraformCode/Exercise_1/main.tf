provider "aws" {
  access_key = "AKIAT5DJCWO500000000" # modified last 8 for security
  secret_key = "k3N91k4865mCNkTDPRMItGZ/0000000000000000" # modified last 16 for security
  region = "us-east-1"
}

resource "aws_instance" "Udacity_T2" {
  ami = "ami-0742b4e673072066f"
  vpc_security_group_ids = [ "sg-3fccb934" ]
  subnet_id = "subnet-026cdd8532750cce7"
  instance_type = "t2.micro"
  count = "4"
  tags = {
    name = "Udacity Project 2 T2"
  }
}

resource "aws_instance" "Udacity_M4" {
  ami = "ami-0742b4e673072066f"
  vpc_security_group_ids = [ "sg-3fccb934" ]
  subnet_id = "subnet-026cdd8532750cce7"
  instance_type = "m4.large"
  count = "2"
  tags = {
    name = "Udacity Project 2 M4"
  }
}