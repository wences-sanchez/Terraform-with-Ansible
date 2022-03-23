data "aws_ssm_parameter" "amazon_linux_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = "jenkins-key"
  public_key = file("credentials/public_key.pub")
}

resource "aws_instance" "jenkins_master" {
  instance_type               = var.instance_type
  ami                         = data.aws_ssm_parameter.amazon_linux_ami.value
  key_name                    = "jenkins-key"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins_sg.id]
  subnet_id                   = aws_subnet.subnet_1.id

  tags = {
    Name = "Jenkins-Master"
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("credentials/private_key")
  }
}

resource "aws_instance" "jenkins_worker" {
  instance_type               = var.instance_type
  ami                         = data.aws_ssm_parameter.amazon_linux_ami.value
  key_name                    = "jenkins-key"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins_sg.id]
  subnet_id                   = aws_subnet.subnet_2.id

  tags = {
    Name = "Jenkins-Worker"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("credentials/private_key")
  }
}