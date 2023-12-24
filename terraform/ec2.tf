# Create an EC2 instance
resource "aws_instance" "java_tech" {
  ami           = "ami-0a0f1259dd1c90938" # Amazon Linux 2 AMI, replace with your preferred AMI
  instance_type = "t2.micro"
  # key_name      = "test"     # Replace with your EC2 key pair name

  security_groups = [aws_security_group.instance_sg.name]

  tags = {
    Name = "java-tech"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install docker -y
              sudo service docker start
              sudo docker run -d -p 8080:80 306942278504.dkr.ecr.ap-south-1.amazonaws.com/java-tech:1.20231223.2.4
              EOF
}