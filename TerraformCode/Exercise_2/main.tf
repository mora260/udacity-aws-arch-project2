provider "aws" {
  access_key = "AKIAT5DJCWO500000000" # modified last 8 for security
  secret_key = "k3N91k4865mCNkTDPRMItGZ/0000000000000000" # modified last 16 for security
  region = var.aws_region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "Udacity-Project2-Terraform-Ex2"
  cidr = "10.0.0.0/16"

  azs             = var.aws_azs
  public_subnets  = ["10.0.101.0/24"]
  private_subnets = []

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

# basic role for lambda
module "basic" {
  source          = "amancevice/lambda-basic-execution-role/aws"
  name            = "LambdaBasicExecRole"
}

module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "udacity-greet-lambda"
  description   = "udacity greeting lambda function"
  handler       = "greet_lambda.lambda_handler"
  runtime       = "python3.8"

  source_path = "./lambda-src/"

  create_role = false
  lambda_role = module.basic.role_arn

  environment_variables = {
    greeting = "Hi!"
  }

  tags = {
    Name = "Udacity Project 2 Greet Lambda"
  }
}