resource "aws_launch_template" "anju_ha_lt" {
  name_prefix   = "anju-ha-lt-"
  image_id      = var.ami
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.anju_app_ha_sg.id]
  }

  user_data = filebase64("userdata.sh")
  key_name  = var.key_name
  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.id
  }

}

resource "aws_autoscaling_group" "anju_ha_asg" {
  desired_capacity    = 3
  max_size            = 6
  min_size            = 3
  vpc_zone_identifier = ["subnet-05f806379727510a1", "subnet-006f580470672aa42", "subnet-0cad5914a26b35df6"] # Replace with your subnet IDs
  launch_template {
    id      = aws_launch_template.anju_ha_lt.id
    version = "$Latest"
  }
  health_check_type         = "ELB"
  health_check_grace_period = 300
  target_group_arns         = [aws_lb_target_group.anju_ha_tg.arn]

}
