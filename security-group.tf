/////////////////VPC 1 SG/////////////////
resource "aws_security_group" "sg-docker" {
  name = "${local.Name}-sg-public"
  vpc_id      = module.vpc1.vpc_id
}

resource "aws_security_group_rule" "port-80" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-docker.id
}

resource "aws_security_group_rule" "port-22" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-docker.id
}

resource "aws_security_group_rule" "port-8888" {
  type              = "ingress"
  from_port         = 8888
  to_port           = 8888
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-docker.id
}

resource "aws_security_group_rule" "allow-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-docker.id
}



