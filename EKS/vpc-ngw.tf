resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = merge(var.tags, { Name = var.vpc.aws_nat_gateway }) 

  depends_on = [aws_internet_gateway.this]
}


/*
    Em Production utilize um NAT GW por AZ($$$) ou utilize ao menos dois na VPC. 
    Criar um EIP para cada NAT GW.
    Atualize as rotas para cada sub-rede privada apontar para o respectivo NAT Gateway.
*/