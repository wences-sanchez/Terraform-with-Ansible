variable "profile" {
  description = "This is the default profile for aws"
  type        = string
  default     = "default"
}

variable "region-eu-south" {
  description = "AWS Region for Milan"
  type        = string
  default     = "eu-south-1"
}

variable "ssm-al2-ami" {
  description = "SSM Label of the AMI for the latest version of Amazon Linux 2"
  # This label has been created by the command 
  # `$ aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --region eu-south-1`
  type    = string
  default = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

variable "instance_type" {
  description = "Instance type of the EC2 instances"
  type        = string
  default     = "t3.micro"
}

variable "my_own_local_cidr" {
  description = "The CIDR (restricted to only me) of the local host who executes Terraform, obtained with help of the command $ ip address"
  type        = string
  default     = "192.168.1.48/32"
}