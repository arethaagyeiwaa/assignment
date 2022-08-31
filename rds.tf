#RDS
resource "aws_db_instance" "MyRDS" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "assignment"
  password             = "timmie2022"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.sql-group.name
}


#RDS subnet group
resource "aws_db_subnet_group" "sql-group" {
  name       = "mysql_sg"
  subnet_ids = [aws_subnet.priv-sub-1.id, aws_subnet.priv-sub-2.id, aws_subnet.priv-sub-3.id]

  tags = {
    Name = "My DB subnet group"
  }
}

