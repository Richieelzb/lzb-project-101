resource "aws_eks_addon" "ebs_csi_driver" {
  depends_on   = [module.eks]
  cluster_name = module.eks.cluster_name
  addon_name   = "aws-ebs-csi-driver"
  //addon_version = null
  addon_version            = "v1.56.0-eksbuild.1"
  service_account_role_arn = aws_iam_role.ebs_csi_driver_role.arn
  //resolve_conflicts = "OVERWRITE"
}