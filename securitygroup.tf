resource "aws_security_group" "anju_app_ha_sg" {
  name        = "anju-app-ha-sg"
  description = "Security group for Anju app"
  vpc_id      = "vpc-0021093bed929b9bd"

}

resource "aws_security_group_rule" "anju_ec2_http_rule" {
  type              = "ingress"
  description       = "Allow HTTP traffic"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.anju_app_ha_sg.id

}

resource "aws_security_group_rule" "anju_ec2_ssh_rule" {
  type              = "ingress"
  description       = "Allow SSH traffic"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.anju_app_ha_sg.id
}

resource "aws_security_group_rule" "anju_ec2_outbound_rule" {
  type              = "egress"
  description       = "Allow all outbound traffic"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.anju_app_ha_sg.id
}


