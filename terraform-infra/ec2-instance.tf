resource "aws_instance" "bastion-instance" {
  ami                    = data.aws_ami.amzn2023_ami.id
  instance_type          = var.instance-type-list[2]
  subnet_id              = module.vpc1.public_subnets[0]
  key_name               = var.key-pair
  user_data              = "${file("${path.module}/bash-scripts/docker-install.sh")}\n${file("${path.module}/bash-scripts/kubectl-install.sh")}"
  iam_instance_profile   = aws_iam_instance_profile.bastion_profile.name
  vpc_security_group_ids = [aws_security_group.sg-docker.id, aws_security_group.sg-kubernetes.id]

  tags = {
    Name = "${local.Name}-eks-docker"
  }
}