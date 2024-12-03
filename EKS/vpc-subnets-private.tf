resource "aws_subnet" "privates_subnets" {

    count   = length(var.vpc.private_subnets)
    
    vpc_id                  = aws_vpc.this.id
    cidr_block              = var.vpc.privates_subnets[count.index].cidr_block
    availability_zone       = var.vpc.privates_subnets[count.index].availability_zone
    map_public_ip_on_launch = var.vpc.privates_subnets[count.index].map_public_ip_on_launch

    tags = merge(var.tags, { Name = var.vpc.privates_subnets[count.index].name })

}

