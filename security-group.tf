/////////////////VPC 1 SG/////////////////
resource "aws_security_group" "sg-docker" {
  name = "${local.Name}-sg-public"
}

resource "aws_security_group_rule" "docker-sg" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-docker.id
}

resource "aws_security_group_rule" "docker-sg" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-docker.id
}

resource "aws_security_group_rule" "docker-sg" {
  type              = "ingress"
  from_port         = 8888
  to_port           = 8888
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-docker.id
}

resource "aws_security_group_rule" "docker-sg" {
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-docker.id
}



