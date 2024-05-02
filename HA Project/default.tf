#vpc
resource "aws_vpc" "nti_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "nti-vpc"
  }
}

#subnet1
resource "aws_subnet" "public_subnets" {
  count= length(var.pub_sub_cidr) 
  vpc_id     = aws_vpc.nti_vpc.id
  cidr_block = var.pub_sub_cidr[count.index]
  availability_zone= var.availability_zone[count.index]
  
  tags = {
    Name = "pub-subnet${count.index}"
  }
}

# #subnet2
resource "aws_subnet" "private_subnets" {
  count= length(var.pub_sub_cidr) 
  vpc_id     = aws_vpc.nti_vpc.id
  cidr_block = var.priv_sub_cidr[count.index]
  availability_zone= var.availability_zone[count.index]

  tags = {
    Name = "priv-subnet${count.index}"
  }
}
