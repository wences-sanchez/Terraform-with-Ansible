resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "Allow TCP/22"
  vpc_id      = aws_vpc.vpc_master.id

  ingress {
    description = "Connect by SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}