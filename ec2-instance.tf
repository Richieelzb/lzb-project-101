resource "aws_instance" "docker-instance" {
  ami             = data.aws_ami.amzn2023_ami.id
  instance_type   = var.instance-type-list[0]
  subnet_id       = module.vpc1.public_subnets[0]
  key_name        = var.key-pair
  user_data       = file("${path.module}/docker-install.sh")
  security_groups = [aws_security_group.docker-sg.id]

  tags = {
    #Name = "vm-${count.index}" // using count
    Name = "${local.Name}-docker" // using for_each

  }
}