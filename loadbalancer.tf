#application loadbalancer
resource "aws_lb" "applicationlb" {
  name               = "assign-alb"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.assignmentsg.id]
  subnets            = [aws_subnet.pub-sub-1.id, aws_subnet.pub-sub-2.id]

  tags = {
    Environment = "assign-alb"
  }
}


#application loadbalancer target group
resource "aws_lb_target_group" "target-group" {
  health_check {
    path                = "/"
    interval            = 10
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
  name        = "assign-alb-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.assignment.id
}

#application loadbalancer listener
resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.applicationlb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group.arn
  }
}
