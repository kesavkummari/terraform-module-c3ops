variable "region" {
  default = "us-east-1"
}

variable "aws_account_id" {
  default = "420815905200"
}

variable "environment" {
  default = "c3ops_dev"
}

variable "global_tags" {
  type = map(any)

  default = {
    "Customer"  = "cb-learnbydoing"
    "CreatedBy" = "terraform"
  }
}

variable "ec2_policy_for_ssm" {
  default = "arn:aws:iam::420815905200:role/c3ops_ssm"
}
