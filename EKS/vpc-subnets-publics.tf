resource "aws_subnet" "public_subnets" {

    count   = length(var.vpc.public_subnets)
    
    vpc_id                  = aws_vpc.this.id
    cidr_block              = var.vpc.public_subnets[count.index].cidr_block
    availability_zone       = var.vpc.public_subnets[count.index].availability_zone
    map_public_ip_on_launch = var.vpc.public_subnets[count.index].map_public_ip_on_launch

    tags = merge(var.tags, { Name = var.vpc.private_subnets[count.index].name })
}

# Vai checar a qntd de declarações de subnets e vai crialas