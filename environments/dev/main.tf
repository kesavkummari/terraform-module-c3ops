# Providers 
provider "aws" {
  # assume_role {
  #   role_arn = "arn:aws:iam::${var.aws_account_id}:role/terraform-automation"
  # }
  region  = var.region
  profile = "default"
}

# Stat File
terraform {
  required_version = "1.5.7"
  backend "s3" {
    bucket = "cb-iac-terraform"
    key    = "c3ops/terraform.tfstate"
    #key            = "environments/cb-shared-services-preprod/c3ops/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "cb-wts-terraform"
    #role_arn   = "arn:aws:iam::420815905200:role/terraform-automation"
    session_name = "terraform"
  }
}

data "terraform_remote_state" "cb_shared_services_account" {
  backend = "s3"

  config = {
    profile = "default"
    bucket  = "cb-iac-terraform"
    key     = "accounts/cloudbinary/terraform.tfstate"
    region  = "us-east-1"
  }
}

module "c3ops_dev" {
  source = "/Users/ck/Desktop/tfmodules/modules/c3ops"

  # App Instance Inputs
  c3ops_vpc_id          = data.terraform_remote_state.cb_shared_services_account.outputs.vpc_id
  c3ops_public_subnets  = data.terraform_remote_state.cb_shared_services_account.outputs.public_subnet_1
  c3ops_private_subnets = data.terraform_remote_state.cb_shared_services_account.outputs.private_subnet_1
  # c3ops_data_subnets      = module.terraform_remote_state.outputs.data_subnets
  ec2_policy_for_ssm      = var.ec2_policy_for_ssm
  c3ops_additional_tags   = var.global_tags
  c3ops_environment       = "dev"
  c3ops_ssl_certificate   = "arn:aws:acm:us-east-1:420815905200:certificate/2ad53c71-ee54-4b54-a562-29ac581ce00b"
  c3ops_key_name          = "cb_shared_services_sshkeys"
  c3ops_admin_linux_sg_id = data.terraform_remote_state.cb_shared_services_account.outputs.linux_sg
  c3ops_admin_web_sg_id   = data.terraform_remote_state.cb_shared_services_account.outputs.web_sg
  c3ops_source_cidrs      = ["10.0.0.0/16", "192.168.0.0/16"]
  c3ops_app_instance_size = "t2.micro"
  c3ops_alb_internal      = "false" //Set this as true if you want an Internal ALB, false if you want a Public ALB
}


# terraform plan -target=module.c3ops_dev -lock=false
# terraform apply -auto-approve -target=module.c3ops_dev -lock=false