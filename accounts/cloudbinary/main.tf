# Versions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Providers 
provider "aws" {
  # assume_role {
  #   role_arn   = "arn:aws:iam::${var.aws_account_id}:role/terraform-automation"
  # }
  region = var.region
  # version = "5.48.0"
  profile = "default"
}

# Stat File
terraform {
  required_version = "1.5.7"
  backend "s3" {
    bucket = "cb-iac-terraform"
    key    = "accounts/cloudbinary/terraform.tfstate"
    region = "us-east-1"
    #dynamodb_table = "cb-iac-terraform"
    #role_arn   = "arn:aws:iam:::role/terraform-automation"
  }
}

# Create a VPC in AWS part of region i.e. NV 
resource "aws_vpc" "cb_shared_services_vpc" {
  cidr_block           = var.cidr_block
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name       = "cb_shared_services_vpc"
    Created_By = "Terraform"
  }
}

output "vpc_id" {
  value = aws_vpc.cb_shared_services_vpc.id
}

# Create a Public-Subnet1 part of cb_shared_services_vpc 
resource "aws_subnet" "cb_shared_services_public_subnet1" {
  vpc_id                  = aws_vpc.cb_shared_services_vpc.id
  cidr_block              = "10.0.1.0/28"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name       = "cb_shared_services_public_subnet1"
    created_by = "Terraform"
  }
}
output "public_subnet_1" {
  value = aws_subnet.cb_shared_services_public_subnet1[*].id
}

resource "aws_subnet" "cb_shared_services_public_subnet2" {
  vpc_id                  = aws_vpc.cb_shared_services_vpc.id
  cidr_block              = "10.0.2.0/28"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name       = "cb_shared_services_public_subnet2"
    created_by = "Terraform"
  }
}

output "public_subnet_2" {
  value = aws_subnet.cb_shared_services_public_subnet2[*].id
}

resource "aws_subnet" "cb_shared_services_private_subnet1" {
  vpc_id            = aws_vpc.cb_shared_services_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name       = "cb_shared_services_private_subnet1"
    created_by = "Terraform"
  }
}

output "private_subnet_1" {
  value = aws_subnet.cb_shared_services_private_subnet1[*].id
}
resource "aws_subnet" "cb_shared_services_private_subnet2" {
  vpc_id            = aws_vpc.cb_shared_services_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name       = "cb_shared_services_private_subnet2"
    created_by = "Terraform"
  }
}
output "private_subnet_2" {
  value = aws_subnet.cb_shared_services_private_subnet2[*].id
}

# IGW
resource "aws_internet_gateway" "cb_shared_services_igw" {
  vpc_id = aws_vpc.cb_shared_services_vpc.id

  tags = {
    Name       = "cb_shared_services_igw"
    Created_By = "Terraform"
  }
}

output "internet_gw" {
  value = aws_internet_gateway.cb_shared_services_igw.id
}

# RTB
resource "aws_route_table" "cb_shared_services_rtb_public" {
  vpc_id = aws_vpc.cb_shared_services_vpc.id

  tags = {
    Name       = "cb_shared_services_rtb_public"
    Created_By = "Teerraform"
  }
}
resource "aws_route_table" "cb_shared_services_rtb_private" {
  vpc_id = aws_vpc.cb_shared_services_vpc.id

  tags = {
    Name       = "cb_shared_services_rtb_private"
    Created_By = "Teerraform"
  }
}
# Create the internet Access 
resource "aws_route" "cb_shared_services_rtb_igw" {
  route_table_id         = aws_route_table.cb_shared_services_rtb_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.cb_shared_services_igw.id

}

# Elastic Ipaddress for NAT Gateway
resource "aws_eip" "cb_shared_services_eip" {
  domain = "vpc"
}

# Create Nat Gateway 
resource "aws_nat_gateway" "cb_shared_services_gw" {
  allocation_id = aws_eip.cb_shared_services_eip.id
  subnet_id     = aws_subnet.cb_shared_services_public_subnet1.id

  tags = {
    Name      = "Nat Gateway"
    Createdby = "Terraform"
  }
}

output "nat_igw" {
  value = aws_nat_gateway.cb_shared_services_gw.id
}

resource "aws_route_table_association" "cb_shared_services_subnet_association1" {
  subnet_id      = aws_subnet.cb_shared_services_public_subnet1.id
  route_table_id = aws_route_table.cb_shared_services_rtb_public.id
}

resource "aws_route_table_association" "cb_shared_services_subnet_association2" {
  subnet_id      = aws_subnet.cb_shared_services_public_subnet2.id
  route_table_id = aws_route_table.cb_shared_services_rtb_public.id
}

resource "aws_route_table_association" "cb_shared_services_subnet_association3" {
  subnet_id      = aws_subnet.cb_shared_services_private_subnet1.id
  route_table_id = aws_route_table.cb_shared_services_rtb_private.id
}

resource "aws_route_table_association" "cb_shared_services_subnet_association4" {
  subnet_id      = aws_subnet.cb_shared_services_private_subnet2.id
  route_table_id = aws_route_table.cb_shared_services_rtb_private.id
}

# Allow internet access from NAT Gateway to Private Route Table
resource "aws_route" "cb_shared_services_rtb_private_gw" {
  route_table_id         = aws_route_table.cb_shared_services_rtb_private.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.cb_shared_services_gw.id
}

# EC2 instance Security group
resource "aws_security_group" "cb_shared_services_linux_sg" {
  vpc_id      = aws_vpc.cb_shared_services_vpc.id
  name        = "cb_shared_services_linux_sg"
  description = "To Allow SSH From IPV4 Devices"

  # Allow Ingress / inbound Of port 22 
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  # Allow Ingress / inbound Of port 8080 
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
  }
  # Allow egress / outbound of all ports 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "cb_shared_services_sg_linux"
    Description = "cb_shared_services allow SSH - RDP"
    createdby   = "terraform"
  }

}

output "linux_sg" {
  value = aws_security_group.cb_shared_services_linux_sg.id
}

# EC2 instance Security group
resource "aws_security_group" "cb_shared_services_web_sg" {
  vpc_id      = aws_vpc.cb_shared_services_vpc.id
  name        = "cb_shared_services_web_sg"
  description = "To Allow SSH From IPV4 Devices"

  # Allow Ingress / inbound Of port 22 
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  # Allow Ingress / inbound Of port 80 
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
  # Allow Ingress / inbound Of port 8080 
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
  }
  # Allow egress / outbound of all ports 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "cb_shared_services_sg"
    Description = "cb_shared_services allow SSH - HTTP and Jenkins"
    createdby   = "terraform"
  }

}


output "web_sg" {
  value = aws_security_group.cb_shared_services_web_sg.id
}

resource "aws_key_pair" "cb_shared_services_sshkeys" {
  key_name   = "cb_shared_services_sshkeys"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIc37aUS+EpM5iPunzjvr+Mb5BKEWzxBTKtRIJN4iCR2 ck@ck.local"

}
output "keypair" {
  value = aws_key_pair.cb_shared_services_sshkeys.key_name
}

# $ ssh-keygen -t rsa
# ssh-keygen -t rsa -b 4096
# .ssh 
# id_rsa      (Private Key)
# id_rsa.pem (Public Key)




