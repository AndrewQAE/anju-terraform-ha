resource "aws_lb" "anju_ha_lb" {
  name               = "anju-ha-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.anju_app_ha_sg.id]
  subnets            = var.subnet_ids

}

resource "aws_lb_target_group" "anju_ha_tg" {
  name        = "anju-ha-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-299"
  }

}

resource "aws_lb_listener" "anju_ha_listener" {
  load_balancer_arn = aws_lb.anju_ha_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.anju_ha_tg.arn
  }
}
