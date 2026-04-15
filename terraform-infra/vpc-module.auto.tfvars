# VPC1 Variables
vpc_name_vpc1                               = "lzb-project-vpc"
vpc_cidr_block_vpc1                         = "10.0.0.0/16"
vpc_availability_zones_vpc1                 = ["ap-south-1a", "ap-south-1b"]
vpc_public_subnets_vpc1                     = ["10.0.101.0/24", "10.0.102.0/24"]
vpc_private_subnets_vpc1                    = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_database_subnets_vpc1                   = ["10.0.151.0/24", "10.0.152.0/24"]
vpc_create_database_subnet_group_vpc1       = true
vpc_create_database_subnet_route_table_vpc1 = true
vpc_enable_nat_gateway_vpc1                 = true
vpc_single_nat_gateway_vpc1                 = true
