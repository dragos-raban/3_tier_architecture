#provider    
    provider "aws" {

      region = "us-west-2"

    }
#vpc
    resource "aws_vpc" "three-tier-vpc" {

      cidr_block       = "10.0.0.0/16"

      enable_dns_support = true
      
      enable_dns_hostnames = true

      tags = {

        Name = "three-tier-vpc"

      }

    }
#subnets

    #public-subnet creation

    resource "aws_subnet" "public_subnet" {

      vpc_id                  = aws_vpc.three-tier-vpc.id

      cidr_block              = "10.0.1.0/24"

      map_public_ip_on_launch = "true"

      availability_zone       = "us-west-2a"

      tags = {

        Name = "public_subnet"

      }

    }


    #private-subnet creation

    resource "aws_subnet" "private_subnet" {

      vpc_id            = aws_vpc.three-tier-vpc.id

      cidr_block        = "10.0.2.0/24"

      availability_zone = "us-west-2a"

      tags = {

        Name = "private_subnet"

      }

    }
#internet gateway    
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.three-tier-vpc.id
}

#nat gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet.id
}

resource "aws_eip" "nat" {
  domain = "vpc"
}