# EC2 Instances ELB and IAM Roles
In this section we will learn how to launch an EC2 instance in a public subnet, install Apache Web Server and deploy a sample website.
> **Inside variable, we can't use Terraform Interpolation**.
## A.1 - Launch EC2 In Public Subnet

## A.2 - Launch EC2 In Public Subnet Userdata Script
We have created a couple of EC2 instance inside public subnet.
````sh

(base) ➜  4_EC2_Instances_ELB_And_AM_Roles git:(main) ✗ tf apply -auto-approve
data.aws_availability_zones.azs: Reading...
data.aws_availability_zones.azs: Read complete after 0s [id=us-east-1]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with 
the following symbols:

  + create

Terraform will perform the following actions:

  # aws_instance.nat will be created
  + resource "aws_instance" "nat" {
      + ami                                  = "ami-05c13eab67c5d8861"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
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
      + source_dest_check                    = false
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "JavaHomeNat"
        }
      + tags_all                             = {
          + "Name" = "JavaHomeNat"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

  # aws_instance.web[0] will be created
  + resource "aws_instance" "web" {
      + ami                                  = "ami-05c13eab67c5d8861"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
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
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Environment" = "default"
          + "Name"        = "WebServer"
        }
      + tags_all                             = {
          + "Environment" = "default"
          + "Name"        = "WebServer"
        }
      + tenancy                              = (known after apply)
      + user_data                            = "bc2907c292361595dd1b21498f7934b9717960ea"
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

  # aws_instance.web[1] will be created
  + resource "aws_instance" "web" {
      + ami                                  = "ami-05c13eab67c5d8861"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
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
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Environment" = "default"
          + "Name"        = "WebServer"
        }
      + tags_all                             = {
          + "Environment" = "default"
          + "Name"        = "WebServer"
        }
      + tenancy                              = (known after apply)
      + user_data                            = "bc2907c292361595dd1b21498f7934b9717960ea"
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

  # aws_internet_gateway.igw will be created
  + resource "aws_internet_gateway" "igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "javaHomeIgw"
        }
      + tags_all = {
          + "Name" = "javaHomeIgw"
        }
      + vpc_id   = (known after apply)
    }

  # aws_route_table.privatert will be created
  + resource "aws_route_table" "privatert" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + core_network_arn           = ""
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = (known after apply)
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = ""
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags             = {
          + "Name" = "javaHomePrivateRT"
        }
      + tags_all         = {
          + "Name" = "javaHomePrivateRT"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table.prt will be created
  + resource "aws_route_table" "prt" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + carrier_gateway_id         = ""
              + cidr_block                 = "0.0.0.0/0"
              + core_network_arn           = ""
              + destination_prefix_list_id = ""
              + egress_only_gateway_id     = ""
              + gateway_id                 = (known after apply)
              + ipv6_cidr_block            = ""
              + local_gateway_id           = ""
              + nat_gateway_id             = ""
              + network_interface_id       = ""
              + transit_gateway_id         = ""
              + vpc_endpoint_id            = ""
              + vpc_peering_connection_id  = ""
            },
        ]
      + tags             = {
          + "Name" = "javaHomePRT"
        }
      + tags_all         = {
          + "Name" = "javaHomePRT"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.private_rt_association[0] will be created
  + resource "aws_route_table_association" "private_rt_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.private_rt_association[1] will be created
  + resource "aws_route_table_association" "private_rt_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.pub_sub_association[0] will be created
  + resource "aws_route_table_association" "pub_sub_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.pub_sub_association[1] will be created
  + resource "aws_route_table_association" "pub_sub_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.pub_sub_association[2] will be created
  + resource "aws_route_table_association" "pub_sub_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.pub_sub_association[3] will be created
  + resource "aws_route_table_association" "pub_sub_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.pub_sub_association[4] will be created
  + resource "aws_route_table_association" "pub_sub_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_route_table_association.pub_sub_association[5] will be created
  + resource "aws_route_table_association" "pub_sub_association" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.nat_sg will be created
  + resource "aws_security_group" "nat_sg" {
      + arn                    = (known after apply)
      + description            = "Allow traffics for Subnets"
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
      + ingress                = (known after apply)
      + name                   = "nat_sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "allow_tls"
        }
      + tags_all               = {
          + "Name" = "allow_tls"
        }
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.private[0] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.20.6.0/24"
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
          + "Name" = "PrivateSubnet-1"
        }
      + tags_all                                       = {
          + "Name" = "PrivateSubnet-1"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.private[1] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.20.7.0/24"
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
          + "Name" = "PrivateSubnet-2"
        }
      + tags_all                                       = {
          + "Name" = "PrivateSubnet-2"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.public[0] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.20.0.0/24"
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
          + "Name" = "PublicSubnet-1"
        }
      + tags_all                                       = {
          + "Name" = "PublicSubnet-1"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.public[1] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.20.1.0/24"
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
          + "Name" = "PublicSubnet-2"
        }
      + tags_all                                       = {
          + "Name" = "PublicSubnet-2"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.public[2] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1c"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.20.2.0/24"
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
          + "Name" = "PublicSubnet-3"
        }
      + tags_all                                       = {
          + "Name" = "PublicSubnet-3"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.public[3] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1d"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.20.3.0/24"
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
          + "Name" = "PublicSubnet-4"
        }
      + tags_all                                       = {
          + "Name" = "PublicSubnet-4"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.public[4] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1e"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.20.4.0/24"
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
          + "Name" = "PublicSubnet-5"
        }
      + tags_all                                       = {
          + "Name" = "PublicSubnet-5"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.public[5] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1f"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.20.5.0/24"
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
          + "Name" = "PublicSubnet-6"
        }
      + tags_all                                       = {
          + "Name" = "PublicSubnet-6"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_vpc.my_app will be created
  + resource "aws_vpc" "my_app" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.20.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
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
          + "Environment" = "default"
          + "Name"        = "JavaHomeVpc"
        }
      + tags_all                             = {
          + "Environment" = "default"
          + "Name"        = "JavaHomeVpc"
        }
    }

Plan: 24 to add, 0 to change, 0 to destroy.
aws_vpc.my_app: Creating...
aws_vpc.my_app: Creation complete after 3s [id=vpc-0697594f7ba724942]
aws_internet_gateway.igw: Creating...
aws_subnet.private[0]: Creating...
aws_subnet.public[5]: Creating...
aws_subnet.public[2]: Creating...
aws_subnet.private[1]: Creating...
aws_subnet.public[0]: Creating...
aws_subnet.public[1]: Creating...
aws_subnet.public[4]: Creating...
aws_subnet.public[3]: Creating...
aws_security_group.nat_sg: Creating...
aws_internet_gateway.igw: Creation complete after 1s [id=igw-0984ddad5c7cf5f98]
aws_route_table.privatert: Creating...
aws_subnet.private[1]: Creation complete after 1s [id=subnet-0569323621766f242]
aws_route_table.prt: Creating...
aws_subnet.private[0]: Creation complete after 1s [id=subnet-0fafa981fc6a8ddf3]
aws_route_table.privatert: Creation complete after 1s [id=rtb-020dc534ee235ee00]
aws_route_table_association.private_rt_association[1]: Creating...
aws_route_table_association.private_rt_association[0]: Creating...
aws_route_table.prt: Creation complete after 1s [id=rtb-044c14a36bb62fe67]
aws_route_table_association.private_rt_association[0]: Creation complete after 1s [id=rtbassoc-0a10a7f57ca78c985]
aws_route_table_association.private_rt_association[1]: Creation complete after 1s [id=rtbassoc-02f7d5ef1f033de3e]
aws_security_group.nat_sg: Creation complete after 3s [id=sg-0d12d7e999a6d8be2]
aws_subnet.public[3]: Still creating... [10s elapsed]
aws_subnet.public[4]: Still creating... [10s elapsed]
aws_subnet.public[5]: Still creating... [10s elapsed]
aws_subnet.public[1]: Still creating... [10s elapsed]
aws_subnet.public[2]: Still creating... [10s elapsed]
aws_subnet.public[0]: Still creating... [10s elapsed]
aws_subnet.public[0]: Creation complete after 11s [id=subnet-08f6e4deed70a6863]
aws_subnet.public[5]: Creation complete after 11s [id=subnet-0c5d4463baa82222f]
aws_subnet.public[4]: Creation complete after 11s [id=subnet-0b46b81378e388a96]
aws_subnet.public[1]: Creation complete after 12s [id=subnet-0667739771e3651a7]
aws_subnet.public[2]: Creation complete after 12s [id=subnet-0581a370a651f37b2]
aws_subnet.public[3]: Creation complete after 12s [id=subnet-027b8815f723e0516]
aws_route_table_association.pub_sub_association[4]: Creating...
aws_route_table_association.pub_sub_association[3]: Creating...
aws_route_table_association.pub_sub_association[2]: Creating...
aws_route_table_association.pub_sub_association[0]: Creating...
aws_route_table_association.pub_sub_association[1]: Creating...
aws_route_table_association.pub_sub_association[5]: Creating...
aws_instance.nat: Creating...
aws_instance.web[1]: Creating...
aws_instance.web[0]: Creating...
aws_route_table_association.pub_sub_association[3]: Creation complete after 0s [id=rtbassoc-0bc3647e0b3181618]
aws_route_table_association.pub_sub_association[1]: Creation complete after 0s [id=rtbassoc-0d40b910c7b8a65b2]
aws_route_table_association.pub_sub_association[2]: Creation complete after 0s [id=rtbassoc-08ae19d0909fe46ac]
aws_route_table_association.pub_sub_association[4]: Creation complete after 0s [id=rtbassoc-08610cdb4201baced]
aws_route_table_association.pub_sub_association[5]: Creation complete after 0s [id=rtbassoc-073e0d4891f09b0a4]
aws_route_table_association.pub_sub_association[0]: Creation complete after 0s [id=rtbassoc-0f7eb081dc2e720f0]
aws_instance.nat: Still creating... [10s elapsed]
aws_instance.web[1]: Still creating... [10s elapsed]
aws_instance.web[0]: Still creating... [10s elapsed]
aws_instance.nat: Creation complete after 13s [id=i-0184638a1dbbb7cd8]
aws_instance.web[1]: Still creating... [20s elapsed]
aws_instance.web[0]: Still creating... [20s elapsed]
aws_instance.web[1]: Creation complete after 22s [id=i-011e6599c8087f502]
aws_instance.web[0]: Still creating... [30s elapsed]
aws_instance.web[0]: Creation complete after 33s [id=i-090a2406ec716318a]

Apply complete! Resources: 24 added, 0 changed, 0 destroyed.
(base) ➜  4_EC2_Instances_ELB_And_AM_Roles git:(main) ✗

````

## A.3 - Create S3 Bucket
In this section we will create a new s3 bucket.

* [Resource: aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket.html)

````sh
...
aws_route_table_association.pub_sub_association[3]: Creation complete after 1s [id=rtbassoc-0fafad588cdb53127]
aws_route_table_association.pub_sub_association[1]: Creation complete after 1s [id=rtbassoc-082eb189666fbc897]
aws_route_table_association.pub_sub_association[0]: Creation complete after 1s [id=rtbassoc-0f7a8f11b532447d5]
aws_route_table_association.pub_sub_association[5]: Creation complete after 1s [id=rtbassoc-0344c7c229443cbe7]
aws_route_table_association.pub_sub_association[2]: Creation complete after 1s [id=rtbassoc-0698e26e2db7d384a]
aws_route_table_association.pub_sub_association[4]: Creation complete after 1s [id=rtbassoc-0545e968bd0e88e68]
aws_s3_bucket.my_bucket: Creation complete after 19s [id=javahome-app-dev-tka]
aws_instance.nat: Still creating... [10s elapsed]
aws_instance.web[0]: Still creating... [10s elapsed]
aws_instance.web[1]: Still creating... [10s elapsed]
aws_instance.nat: Creation complete after 14s [id=i-08a8e94da2e833d52]
aws_instance.web[1]: Still creating... [20s elapsed]
aws_instance.web[0]: Still creating... [20s elapsed]
aws_instance.web[1]: Still creating... [30s elapsed]
aws_instance.web[0]: Still creating... [30s elapsed]
aws_instance.web[0]: Creation complete after 33s [id=i-0e1a761dc8dbb876f]
aws_instance.web[1]: Creation complete after 33s [id=i-08a84758c46ca000e]

Apply complete! Resources: 25 added, 0 changed, 0 destroyed.
````

## A.4 - Attach IAM Role to EC2 and Terraform Template
### A.4.1 - Create an IAM role
We have create an s3 bucket. Now we want to create an IAM role for EC2 instances. Using IAM role, applications running on EC2 instances will get access to s3 for uploading object.

First we need to create ``Assume Role`` then ``IAM Policy`` follow by creating ``IAM Role`` itself by linking those two.

* [template_file](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file)
* [Resource: aws_iam_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy)

````sh
.................
Plan: 27 to add, 0 to change, 0 to destroy.
aws_vpc.my_app: Creating...
aws_s3_bucket.my_bucket: Creating...
aws_iam_role.s3_ec2_role: Creating...
aws_iam_role.s3_ec2_role: Creation complete after 1s [id=s3_ec2_role]
aws_iam_role_policy.s3_ec2_policy: Creating...
aws_iam_role_policy.s3_ec2_policy: Creation complete after 0s [id=s3_ec2_role:s3_ec2_policy]

Apply complete! Resources: 27 added, 0 changed, 0 destroyed.
(base) ➜  4_EC2_Instances_ELB_And_AM_Roles git:(main) ✗
````

![Alt text](../images/32.png)

### A.4.2 - Attach the IAM role to an EC2 instance.
For attaching IAM role to EC2 instance, we need to create an ``instance profile``.
> An **IAM Profile** is effectively **the glue that links an IAM Role to an Amazon EC2 instance**. They can only take one role each (even though it shows as an array of Roles). f you want to play with the Instance Profile, you'll need to do it through the AWS CLI or API calls.

* [Resource: aws_iam_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile)
* [AWS IAM EC2 Instance Role using Terraform](https://devopslearning.medium.com/aws-iam-ec2-instance-role-using-terraform-fa2b21488536)
* [Create an IAM instance profile for your Amazon EC2 instances](https://docs.aws.amazon.com/codedeploy/latest/userguide/getting-started-create-iam-instance-profile.html)

````sh
.........................
Plan: 1 to add, 2 to change, 0 to destroy.
aws_iam_instance_profile.s3_ec2_profile: Creating...
aws_iam_instance_profile.s3_ec2_profile: Creation complete after 1s [id=s3_ec2_profile]
aws_instance.web[0]: Modifying... [id=i-0e879f73465cdbe08]
aws_instance.web[1]: Modifying... [id=i-08f01fb66cbea9c24]
aws_instance.web[1]: Still modifying... [id=i-08f01fb66cbea9c24, 10s elapsed]
aws_instance.web[0]: Still modifying... [id=i-0e879f73465cdbe08, 10s elapsed]
aws_instance.web[1]: Still modifying... [id=i-08f01fb66cbea9c24, 20s elapsed]
aws_instance.web[0]: Still modifying... [id=i-0e879f73465cdbe08, 20s elapsed]
aws_instance.web[1]: Modifications complete after 21s [id=i-08f01fb66cbea9c24]
aws_instance.web[0]: Modifications complete after 22s [id=i-0e879f73465cdbe08]

Apply complete! Resources: 1 added, 2 changed, 0 destroyed.
````

![Alt text](../images/33.png)

## A.5 - Create Security Groups Attach to EC2
We have networking configurâtes the private and public subnets, we've deployed ec2 instance into public and creates iam role for ec2 instances to access s3 bucket. Now we will create **security groups** for ec2 instances in public subnets.

````sh
........................
aws_route_table.prt: Creating...
aws_security_group.nat_sg: Creation complete after 3s [id=sg-03fca08b88c8175d6]
aws_route_table_association.private_rt_association[0]: Creating...
aws_security_group.web_sg: Creation complete after 4s [id=sg-0675174dc3fbd0d28]
aws_route_table_association.private_rt_association[1]: Creating...
aws_route_table_association.private_rt_association[0]: Creation complete after 1s [id=rtbassoc-0df88cb67d170f484]
aws_route_table_association.private_rt_association[1]: Creation complete after 0s [id=rtbassoc-03a90f713ac4c0ed7]
aws_route_table.prt: Creation complete after 1s [id=rtb-0ec92b3ebd6817d57]

Apply complete! Resources: 29 added, 0 changed, 0 destroyed.
(base) ➜  4_EC2_Instances_ELB_And_AM_Roles git:(main) ✗
````

![Alt text](../images/34.png)
