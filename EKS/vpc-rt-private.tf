resource "aws_route_table" "rt_private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }
  
  tags = merge(var.tags, { Name = var.vpc.private_router_table_name })
}

resource "aws_route_table_association" "privates" {
  count = length(var.vpc.privates_subnets)

  subnet_id      = aws_subnet.privates_subnets[count.index].id
  route_table_id = aws_route_table.rt_private.id
}