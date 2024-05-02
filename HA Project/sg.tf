resource "aws_security_group" "sg" {
  name        = "security-group"
  description = "Security group allowing http traffic"
  vpc_id      = aws_vpc.nti_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // Allows HTTP from any IPv4 address
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "nti-sg"
  }
}