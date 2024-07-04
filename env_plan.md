ck@ck dev % terraform plan -target=module.c3ops_dev
Acquiring state lock. This may take a few moments...
data.terraform_remote_state.cb_shared_services_account: Reading...
data.terraform_remote_state.cb_shared_services_account: Read complete after 4s
module.c3ops_dev.data.aws_vpc.selected_vpc: Reading...
module.c3ops_dev.data.aws_subnet.selected_private_subnets[0]: Reading...
module.c3ops_dev.data.aws_subnet.selected_public_subnets[0]: Reading...
module.c3ops_dev.data.aws_subnet.selected_public_subnets[1]: Reading...
module.c3ops_dev.data.aws_subnet.selected_private_subnets[1]: Reading...
module.c3ops_dev.data.aws_subnet.selected_public_subnets[1]: Read complete after 2s [id=subnet-044109de0ef738543]
module.c3ops_dev.data.aws_subnet.selected_private_subnets[0]: Read complete after 2s [id=subnet-03a8482d42c9d68ce]
module.c3ops_dev.data.aws_subnet.selected_public_subnets[0]: Read complete after 2s [id=subnet-044109de0ef738543]
module.c3ops_dev.data.aws_subnet.selected_private_subnets[1]: Read complete after 2s [id=subnet-03a8482d42c9d68ce]
module.c3ops_dev.data.aws_vpc.selected_vpc: Read complete after 3s [id=vpc-06daefaf25d87cc68]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # module.c3ops_dev.aws_cloudwatch_metric_alarm.c3ops_app_cloudwatch_recovery will be created
  + resource "aws_cloudwatch_metric_alarm" "c3ops_app_cloudwatch_recovery" {
      + actions_enabled                       = true
      + alarm_actions                         = [
          + "arn:aws:automate:us-east-1:ec2:recover",
        ]
      + alarm_description                     = "This metric monitors ec2 status check"
      + alarm_name                            = "dev-c3ops-app-status-check-failed"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanOrEqualToThreshold"
      + dimensions                            = (known after apply)
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 2
      + id                                    = (known after apply)
      + metric_name                           = "StatusCheckFailed_System"
      + namespace                             = "AWS/EC2"
      + period                                = 300
      + statistic                             = "Maximum"
      + tags_all                              = (known after apply)
      + threshold                             = 1
      + treat_missing_data                    = "missing"
    }

  # module.c3ops_dev.aws_iam_instance_profile.c3ops_profile will be created
  + resource "aws_iam_instance_profile" "c3ops_profile" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = "c3ops-dev"
      + name_prefix = (known after apply)
      + path        = "/"
      + role        = "c3ops-dev"
      + tags_all    = (known after apply)
      + unique_id   = (known after apply)
    }

  # module.c3ops_dev.aws_iam_role.c3ops_role will be created
  + resource "aws_iam_role" "c3ops_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = [
                              + "ec2.amazonaws.com",
                              + "ssm.amazonaws.com",
                            ]
                        }
                      + Sid       = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "c3ops-dev"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)
    }

  # module.c3ops_dev.aws_instance.c3ops_app will be created
  + resource "aws_instance" "c3ops_app" {
      + ami                                  = "ami-07d9b9ddc6cd8dd30"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = false
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = "c3ops-dev"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "cb_shared_services_sshkeys"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = "subnet-03a8482d42c9d68ce"
      + tags                                 = {
          + "Application"  = "c3ops"
          + "Business"     = "CB_TS"
          + "ContactEmail" = "info@c3ops.io"
          + "CreatedBy"    = "terraform"
          + "Customer"     = "cb-learnbydoing"
          + "Name"         = "c3ops-dev-app"
        }
      + tags_all                             = {
          + "Application"  = "c3ops"
          + "Business"     = "CB_TS"
          + "ContactEmail" = "info@c3ops.io"
          + "CreatedBy"    = "terraform"
          + "Customer"     = "cb-learnbydoing"
          + "Name"         = "c3ops-dev-app"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + root_block_device {
          + delete_on_termination = true
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags_all              = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 10
          + volume_type           = "gp2"
        }
    }

  # module.c3ops_dev.aws_security_group.c3ops_app_sg will be created
  + resource "aws_security_group" "c3ops_app_sg" {
      + arn                    = (known after apply)
      + description            = "c3ops Security Group."
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "c3ops-dev-app-"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Application"  = "c3ops"
          + "Business"     = "CB_TS"
          + "ContactEmail" = "info@c3ops.io"
          + "CreatedBy"    = "terraform"
          + "Customer"     = "cb-learnbydoing"
          + "Name"         = "c3ops-dev-app"
        }
      + tags_all               = {
          + "Application"  = "c3ops"
          + "Business"     = "CB_TS"
          + "ContactEmail" = "info@c3ops.io"
          + "CreatedBy"    = "terraform"
          + "Customer"     = "cb-learnbydoing"
          + "Name"         = "c3ops-dev-app"
        }
      + vpc_id                 = "vpc-06daefaf25d87cc68"
    }

  # module.c3ops_dev.aws_security_group_rule.c3ops_sg_app_22_rule will be created
  + resource "aws_security_group_rule" "c3ops_sg_app_22_rule" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 22
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 22
      + type                     = "ingress"
    }

  # module.c3ops_dev.aws_security_group_rule.c3ops_sg_app_3389_rule will be created
  + resource "aws_security_group_rule" "c3ops_sg_app_3389_rule" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 3389
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 3389
      + type                     = "ingress"
    }

  # module.c3ops_dev.aws_security_group_rule.c3ops_sg_app_80_rule will be created
  + resource "aws_security_group_rule" "c3ops_sg_app_80_rule" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 80
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 80
      + type                     = "ingress"
    }

  # module.c3ops_dev.aws_security_group_rule.c3ops_sg_rule_app_outgoing will be created
  + resource "aws_security_group_rule" "c3ops_sg_rule_app_outgoing" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 0
      + id                       = (known after apply)
      + protocol                 = "-1"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 0
      + type                     = "egress"
    }

Plan: 9 to add, 0 to change, 0 to destroy.
╷
│ Warning: Resource targeting is in effect
│ 
│ You are creating a plan with the -target option, which means that the result of this plan may not represent all of the
│ changes requested by the current configuration.
│ 
│ The -target option is not for routine use, and is provided only for exceptional situations such as recovering from
│ errors or mistakes, or when Terraform specifically suggests to use it as part of an error message.
╵