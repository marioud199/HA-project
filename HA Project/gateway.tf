resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.nti_vpc.id

  tags = {
    Name = "nti-igw"
  }
}

# Create a NAT gateway
resource "aws_nat_gateway" "ngw" {
  count= length(aws_subnet.public_subnets)
  allocation_id = aws_eip.eip[count.index].id
  subnet_id     = aws_subnet.public_subnets[count.index].id
}

# Create an Elastic IP for the NAT gateway
resource "aws_eip" "eip" {
  count= length(aws_subnet.public_subnets)
  domain = "vpc"
}