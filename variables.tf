//Resources///////////////////////////////////////////////////////

variable "instance-type-list" {
  type    = list(string)
  default = ["t3.micro", "t3.medium", "t3.large"]
}

variable "key-pair" {
  default = "lupfumo-key"
}

///VPC Modules-1 ///////////////////////////////////////////////////////////////////////////
variable "vpc_name_vpc1" {
  type = string
  # default = "vpc-lzb"
}

variable "vpc_availability_zones_vpc1" {
  type    = list(string)
  default = []
}

variable "vpc_cidr_block_vpc1" {
  type = string
}

variable "vpc_public_subnets_vpc1" {
  type = list(string)
}

variable "vpc_private_subnets_vpc1" {
  type = list(string)
}

variable "vpc_database_subnets_vpc1" {
  type = list(string)
}

variable "vpc_create_database_subnet_group_vpc1" {
  type = bool
}

variable "vpc_create_database_subnet_route_table_vpc1" {
  type = bool
}

variable "vpc_enable_nat_gateway_vpc1" {
  type = bool
}

variable "vpc_single_nat_gateway_vpc1" {
  type = bool
}


//////generic/////////////////////////////
variable "aws-region" {
  default = "eu-west-1"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "business-division" {
  type    = string
  default = "wallawalla"
}