#first instance
resource "aws_instance" "instance1" {
  ami                    = "ami-0e34bbddc66def5ac"
  instance_type          = "t2.micro"
  key_name               = "anotherkey"
  availability_zone      = "eu-west-2a"
  subnet_id              = aws_subnet.pub-sub-1.id
  vpc_security_group_ids = [aws_security_group.assignmentsg.id]

  tags = {
    Name = "instance1"
  }
}

#second instance
resource "aws_instance" "instance2" {
  ami                    = "ami-0e34bbddc66def5ac"
  instance_type          = "t2.micro"
  key_name               = "anotherkey"
  availability_zone      = "eu-west-2b"
  subnet_id              = aws_subnet.pub-sub-2.id
  vpc_security_group_ids = [aws_security_group.assignmentsg.id]

  tags = {
    Name = "instance2"
  }
}