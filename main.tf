#vpc    
    provider "aws" {

      region = "us-west-2"

    }

    resource "aws_vpc" "<your-desired-name>" {

      cidr_block       = var.vpc_cidr

      instance_tenancy = "default"

      tags = {

        Name = "your-desired-name"

      }

    }