# resource "aws_eip" "bastion-eip" {
#   depends_on = [aws_instance.bastion-instance, module.vpc1]
#   instance   = aws_instance.bastion-instance.id
#   // vpc = true
#   tags = local.common_tags
# }