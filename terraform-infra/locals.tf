
locals {
  owners      = var.business-division
  Environment = var.environment
  Name        = "${var.environment}-${var.business-division}"

  eks_cluster_name = "${local.Name}-${var.eks-cluster}"

  db_creds = jsondecode(
    aws_secretsmanager_secret_version.mysql_pwd_value.secret_string
  )

  common_tags = {
    owners      = local.owners
    environment = local.Environment
  }
}