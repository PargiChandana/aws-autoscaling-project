# Security group
########################################
# ALB Security Group
########################################
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Security group for ALB"
  vpc_id      = aws_vpc.my_vpc.id

  # ALB must accept traffic from internet on 80
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

########################################
# EC2 Security Group
########################################
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Security group for EC2"
  vpc_id      = aws_vpc.my_vpc.id

  # IMPORTANT!!
  # Allow only ALB to talk to EC2 instances on port 80
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # OPTIONAL (SSH from YOUR IP only)
  ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

