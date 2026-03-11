resource "aws_eip" "bastion-eip" {
  depends_on = [aws_instance.main-instance, module.vpc1]
  instance   = aws_instance.main-instance.id
  // vpc = true
  tags = local.common_tags
}