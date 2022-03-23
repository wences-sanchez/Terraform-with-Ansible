# Create VPC in eu-south-1
resource "aws_vpc" "vpc_master" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Master-VPC-jenkins"
  }
}

resource "aws_vpc" "vpc_worker" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Worker-VPC-jenkins"
  }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc_master.id
}

# Get all available AZs in VPC for its region
data "aws_availability_zones" "azs" {
    state = "available"  
}

# Create subnet-1
resource "aws_subnet" "subnet_1" {
  vpc_id = aws_vpc.vpc_master.id
  availability_zone = element(data.aws_availability_zones.azs.names, 0)
  cidr_block = "10.0.1.0/24"
}

# Create subnet-2
resource "aws_subnet" "subnet_2" {
  vpc_id = aws_vpc.vpc_master.id
  availability_zone = element(data.aws_availability_zones.azs.names, 1)
  cidr_block = "10.0.2.0/24"
}