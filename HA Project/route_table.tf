#route table public
resource "aws_route_table" "pub-route-tables" {
    count= length(aws_subnet.public_subnets)
  vpc_id = aws_vpc.nti_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "route-public-table${count.index}"
  }
}

#route table private
resource "aws_route_table" "priv-route-tables" {
  count= length(aws_subnet.private_subnets)
  vpc_id = aws_vpc.nti_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw[count.index].id
  }

  tags = {
    Name = "route-private-table${count.index}"
  }
}


resource "aws_route_table_association" "route-table-association-subnet-igw" {
  count= length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.pub-route-tables[count.index].id
}

resource "aws_route_table_association" "route-table-association-subnet-ngw" {
  count= length(aws_subnet.private_subnets)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.priv-route-tables[count.index].id
}