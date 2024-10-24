terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">= 1.9"
    }
  }
}



provider "aws" {
  region = var.am_region
}