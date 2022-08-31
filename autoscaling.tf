resource "aws_autoscaling_group" "my-auto-sg" {
  name                      = "autoscal-grp"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  launch_configuration      = aws_launch_configuration.asg-launch-config.name
  vpc_zone_identifier       = [aws_subnet.pub-sub-1.id, aws_subnet.pub-sub-2.id]

}


resource "aws_launch_configuration" "asg-launch-config" {
  name                        = "web_config"
  image_id                    = "ami-0e34bbddc66def5ac"
  instance_type               = "t2.micro"
  security_groups             = [aws_security_group.assignmentsg.id]
  key_name                    = "anotherkey"
  associate_public_ip_address = true
}
