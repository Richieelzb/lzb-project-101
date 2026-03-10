
locals {
  owners      = var.business-division
  Environment = var.environment
  Name        = "${var.environment}-${var.business-division}"

  eks_cluster_name = "${local.Name}-${var.eks-cluster}"

  common_tags = {
    owners      = local.owners
    environment = local.Environment
  }
}