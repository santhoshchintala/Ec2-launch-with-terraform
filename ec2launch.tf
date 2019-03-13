provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAJSLFTY75TMQZCRNA"
  secret_key = "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"
}

#security group
resource "aws_security_group" "test_sg" {
  name   = "SG1"
  vpc_id = "vpc-e384de8b"
  ingress {
    to_port     = "22"
    from_port   = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
#key pair
resource "aws_key_pair" "deployer" {
key_name = "deployer-key"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLRPZFQbQLV/tHJvI6Zg3Uw0YJhQsmBMskk2RwFEjZzx8PR2BDhZUDfElABeYWnF3XWNLyLiU0h824GkPZtUI/Sv+T3NDv4G12+KeNNlGn5hx9fxX7qon9Rn9jtThqkNgGrmcKMjUC1UlMibsvThyotHCMAc3X5VEhAwO3RUJDIgM0hLJWzAHoMd8+fgbogzMfaU5B+saEZoGphDMWYZWx2kznN+X0Uur0kgVO3BrVHxnxJGylDkLWORYuhHu1xa4ChXNUukun+nLQ4ScpZ1RFucvpOBeV/II3cilekOhyndmGCmamxXygIkFNfIqxXRXYEg8iS69W6EvdCBZpchXT santhosh@CITPL-L-003"
}
resource "aws_instance" "web" {
  ami           = "ami-0ad42f4f66f6c1cc9"
  instance_type = "t2.micro"
  key_name      = "cloudwatch"

  tags = {
    Name = "HelloWorld"
  }
}
