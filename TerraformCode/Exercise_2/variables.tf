variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "aws_azs" {
  type = list(string)
  default = ["us-east-1a"]
}