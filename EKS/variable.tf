variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
    productname = "eks-2024"
    teamname    = "devops"
    centercost  = "777"
  }
}

variable "vpc" {
  type = object({
    name       = string
    cidr_block = string

    internet_gateway_name = string
    nat_gateway_name      = string
    eip                   = string

    public_router_table_name  = string
    private_router_table_name = string

    publics_subnets = list(object({
      name                    = string
      map_public_ip_on_launch = bool
      availability_zone       = string
      cidr_block              = string
    }))

    privates_subnets = list(object({
      name                    = string
      map_public_ip_on_launch = bool
      availability_zone       = string
      cidr_block              = string
    }))

  })

  default = {
    name       = "vpc-eks-devops-2024"
    cidr_block = "172.24.0.0/22"

    internet_gateway_name = "igw-vpc-eks-devops-2024"
    nat_gateway_name      = "ngw-vpc-eks-devops-2024"
    eip                   = "eip-ngw-vpc-eks-devops-2024"

    public_router_table_name  = "rt-public-eks-devops-2024"
    private_router_table_name = "rt-private-eks-devops-2024"

    publics_subnets = [
      {
        name                    = "public-us-east-1a"
        map_public_ip_on_launch = true
        availability_zone       = "us-east-1a"
        cidr_block              = "172.24.1.0/24"
      },
      {
        name                    = "public-us-east-1b"
        map_public_ip_on_launch = false
        availability_zone       = "us-east-1b"
        cidr_block              = "172.24.2.0/24"
      }
    ]

    privates_subnets = [
      {
        name                    = "private-us-east-1a"
        map_public_ip_on_launch = false
        availability_zone       = "us-east-1a"
        cidr_block              = "172.24.3.0/24"
      },
      {
        name                    = "private-us-east-1b"
        map_public_ip_on_launch = false
        availability_zone       = "us-east-1b"
        cidr_block              = "172.24.4.0/24"
      }
    ]
  }
}

variable "eks_cluster" {
  type = object({
    name                         = string
    enabled_cluster_log_types    = list(string)
    access_config                = string
    name_assume_role_cluster_eks = string

    node_group_v1 = list(object({
      name           = string
      instance_types = list(string)
      capacity_type  = string
      scaling_config_desired_size   = number
      scaling_config_max_size       = number
      scaling_config_min_size       = number
      update_config_max_unavailable = number
    }))
  })

  default = {
    name                         = "eks-dev-01"
    enabled_cluster_log_types    = ["api", "audit", "authenticator"]
    access_config                = "API_AND_CONFIG_MAP"
    name_assume_role_cluster_eks = "role-cluster-eks-devops-2024"
    node_group_v1 = [
      {
        name                          = "eks-dev-001"
        instance_types                = ["t3.large"]
        capacity_type                 = "ON_DEMAND"
        scaling_config_desired_size   = 1
        scaling_config_max_size       = 2
        scaling_config_min_size       = 1
        update_config_max_unavailable = 1
      }
    ]
  }
}