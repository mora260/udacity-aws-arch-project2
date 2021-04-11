terraform {
    backend "s3" {
        bucket = "udacity-andres-terraform-tests"
        key = "states/project2/ex1/terraform.tfstate" 
        region = "us-east-1"
    }
}