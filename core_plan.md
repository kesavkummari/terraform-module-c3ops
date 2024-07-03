ck@ck cloudbinary % terraform plan    
data.aws_iam_account_alias.current: Reading...
data.aws_iam_account_alias.current: Read complete after 1s [id=cloudbinary-awsdevops]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # aws_eip.cb_shared_services_eip will be created
  + resource "aws_eip" "cb_shared_services_eip" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags_all             = (known after apply)
      + vpc                  = (known after apply)
    }

  # aws_internet_gateway.cb_shared_services_igw will be created
  + resource "aws_internet_gateway" "cb_shared_services_igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Created_By" = "Terraform"
          + "Name"       = "cb_shared_services_igw"
        }
      + tags_all = {
          + "Created_By" = "Terraform"
          + "Name"       = "cb_shared_services_igw"
        }
      + vpc_id   = (known after apply)
    }

  # aws_key_pair.cb_shared_services_sshkeys will be created
  + resource "aws_key_pair" "cb_shared_services_sshkeys" {
      + arn             = (known after apply)
      + fingerprint     = (known after apply)
      + id              = (known after apply)
      + key_name        = "cb_shared_services_sshkeys"
      + key_name_prefix = (known after apply)
      + key_pair_id     = (known after apply)
      + key_type        = (known after apply)
      + public_key      = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIc37aUS+EpM5iPunzjvr+Mb5BKEWzxBTKtRIJN4iCR2 ck@ck.local"
      + tags_all        = (known after apply)
    }

  # aws_nat_gateway.cb_shared_services_gw will be created
  + resource "aws_nat_gateway" "cb_shared_services_gw" {
      + allocation_id                      = (known after apply)
      + association_id                     = (known after apply)
      + connectivity_type                  = "public"
      + id                                 = (known after apply)
      + network_interface_id               = (known after apply)
      + private_ip                         = (known after apply)
      + public_ip                          = (known after apply)
      + secondary_private_ip_address_count = (known after apply)
      + secondary_private_ip_addresses     = (known after apply)
      + subnet_id                          = (known after apply)
      + tags                               = {
          + "Createdby" = "Terraform"
          + "Name"      = "Nat Gateway"
        }
      + tags_all                           = {
          + "Createdby" = "Terraform"
          + "Name"      = "Nat Gateway"
        }
    }

  # aws_route.cb_shared_services_rtb_igw will be created
  + resource "aws_route" "cb_shared_services_rtb_igw" {
      + destination_cidr_block = "0.0.0.0/0"
      + gateway_id             = (known after apply)
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)
    }

  # aws_route.cb_shared_services_rtb_private_gw will be created
  + resource "aws_route" "cb_shared_services_rtb_private_gw" {
      + destination_cidr_block = "0.0.0.0/0"
      + gateway_id             = (known after apply)
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)
    }

  # aws_route_table.cb_shared_services_rtb_private will be created
  + resource "aws_route_table" "cb_shared_services_rtb_private" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Created_By" = "Teerraform"
          + "Name"       = "cb_shared_services_rtb_private"
        }
      + tags_all         = {
          + "Created_By" = "Teerraform"
          + "Name"       = "cb_shared_services_rtb_private"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table.cb_shared_services_rtb_public will be created
  + resource "aws_route_table" "cb_shared_services_rtb_public" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Created_By" = "Teerraform"
          + "Name"       = "cb_shared_services_rtb_public"
        }
      + tags_all         = {
          + "Created_By" = "Teerraform"
          + "Name"       = "cb_shared_services_rtb_public"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.cb_shared_services_subnet_association1 will be created
  + resource "aws_route_table_association" "cb_shared_services_subnet_association1" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.cb_shared_services_subnet_association2 will be created
  + resource "aws_route_table_association" "cb_shared_services_subnet_association2" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.cb_shared_services_subnet_association3 will be created
  + resource "aws_route_table_association" "cb_shared_services_subnet_association3" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.cb_shared_services_subnet_association4 will be created
  + resource "aws_route_table_association" "cb_shared_services_subnet_association4" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.cb_shared_services_linux_sg will be created
  + resource "aws_security_group" "cb_shared_services_linux_sg" {
      + arn                    = (known after apply)
      + description            = "To Allow SSH From IPV4 Devices"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 3389
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 3389
            },
        ]
      + name                   = "cb_shared_services_linux_sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Description" = "cb_shared_services allow SSH - RDP"
          + "Name"        = "cb_shared_services_sg_linux"
          + "createdby"   = "terraform"
        }
      + tags_all               = {
          + "Description" = "cb_shared_services allow SSH - RDP"
          + "Name"        = "cb_shared_services_sg_linux"
          + "createdby"   = "terraform"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_security_group.cb_shared_services_web_sg will be created
  + resource "aws_security_group" "cb_shared_services_web_sg" {
      + arn                    = (known after apply)
      + description            = "To Allow SSH From IPV4 Devices"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 3389
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 3389
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = "cb_shared_services_web_sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Description" = "cb_shared_services allow SSH - HTTP and Jenkins"
          + "Name"        = "cb_shared_services_sg"
          + "createdby"   = "terraform"
        }
      + tags_all               = {
          + "Description" = "cb_shared_services allow SSH - HTTP and Jenkins"
          + "Name"        = "cb_shared_services_sg"
          + "createdby"   = "terraform"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.cb_shared_services_private_subnet1 will be created
  + resource "aws_subnet" "cb_shared_services_private_subnet1" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.3.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name"       = "cb_shared_services_private_subnet1"
          + "created_by" = "Terraform"
        }
      + tags_all                                       = {
          + "Name"       = "cb_shared_services_private_subnet1"
          + "created_by" = "Terraform"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.cb_shared_services_private_subnet2 will be created
  + resource "aws_subnet" "cb_shared_services_private_subnet2" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.4.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name"       = "cb_shared_services_private_subnet2"
          + "created_by" = "Terraform"
        }
      + tags_all                                       = {
          + "Name"       = "cb_shared_services_private_subnet2"
          + "created_by" = "Terraform"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.cb_shared_services_public_subnet1 will be created
  + resource "aws_subnet" "cb_shared_services_public_subnet1" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/28"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name"       = "cb_shared_services_public_subnet1"
          + "created_by" = "Terraform"
        }
      + tags_all                                       = {
          + "Name"       = "cb_shared_services_public_subnet1"
          + "created_by" = "Terraform"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.cb_shared_services_public_subnet2 will be created
  + resource "aws_subnet" "cb_shared_services_public_subnet2" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.2.0/28"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name"       = "cb_shared_services_public_subnet2"
          + "created_by" = "Terraform"
        }
      + tags_all                                       = {
          + "Name"       = "cb_shared_services_public_subnet2"
          + "created_by" = "Terraform"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_vpc.cb_shared_services_vpc will be created
  + resource "aws_vpc" "cb_shared_services_vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Created_By" = "Terraform"
          + "Name"       = "cb_shared_services_vpc"
        }
      + tags_all                             = {
          + "Created_By" = "Terraform"
          + "Name"       = "cb_shared_services_vpc"
        }
    }

Plan: 19 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + internet_gw      = (known after apply)
  + keypair          = "cb_shared_services_sshkeys"
  + linux_sg         = (known after apply)
  + nat_igw          = (known after apply)
  + private_subnet_1 = [
      + (known after apply),
    ]
  + private_subnet_2 = [
      + (known after apply),
    ]
  + public_subnet_1  = [
      + (known after apply),
    ]
  + public_subnet_2  = [
      + (known after apply),
    ]
  + vpc_id           = (known after apply)
  + web_sg           = (known after apply)

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run
"terraform apply" now.