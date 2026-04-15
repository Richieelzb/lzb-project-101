/////////////////DOCKER SG/////////////////
resource "aws_security_group" "sg-docker" {
  name   = "${local.Name}-sg-docker"
  vpc_id = module.vpc1.vpc_id
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

resource "aws_security_group_rule" "port-5000" {
  type              = "ingress"
  from_port         = 5000
  to_port           = 5000
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

resource "aws_security_group_rule" "allow-all-docker" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-docker.id
}

/////////////////KUBERNETES SG/////////////////
resource "aws_security_group" "sg-kubernetes" {
  name   = "${local.Name}-sg-kubernetes"
  vpc_id = module.vpc1.vpc_id
}

resource "aws_security_group_rule" "bastion_sg" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-kubernetes.id
}

resource "aws_security_group_rule" "allow-all-k8s" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-kubernetes.id
}
# Allow bastion to SSH into nodes (attach to node SG)
resource "aws_security_group_rule" "allow_bastion_to_nodes_ssh" {
  type              = "ingress"
  description       = "SSH from bastion to nodes"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.eks.node_security_group_id # EKS module output
  //security_group_id        = module.eks.node_security_group_id # requires EKS module output
  source_security_group_id = aws_security_group.sg-kubernetes.id
}


# OR allow HTTPS from a CIDR
resource "aws_security_group_rule" "eks_https_from_cidr" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = module.eks.cluster_security_group_id
  cidr_blocks       = ["0.0.0.0/0"]
}

/////////////////RDS SG/////////////////
resource "aws_security_group" "rds" {
  depends_on  = [aws_db_instance.mysql]
  name        = "rds-mysql-sg"
  description = "Allow MySQL from EKS nodes"
  vpc_id      = module.vpc1.vpc_id

  ingress {
    description     = "MySQL from EKS worker nodes"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [module.eks.node_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}