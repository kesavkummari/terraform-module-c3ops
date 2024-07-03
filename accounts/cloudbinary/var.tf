data "aws_iam_account_alias" "current" {}

variable "region" {
  default = "us-east-1"
}

variable "aws_account_id" {
  default = "420815905200"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "instance_tenancy" {
  default = "default"
}

variable "enable_dns_support" {
  default = true
}

variable "enable_dns_hostnames" {
  default = true
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
  default     = [] # You can set a default value if needed
}


variable "public_subnets" {
  description = "List of Public subnet IDs"
  type        = list(string)
  default     = [] # You can set a default value if needed
}
