resource "aws_eks_addon" "pod_identity_agent" {
  depends_on    = [module.eks]
  cluster_name  = module.eks.cluster_name
  addon_name    = "eks-pod-identity-agent"
  addon_version = "v1.3.10-eksbuild.2"
  //resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_pod_identity_association" "example" {
  depends_on      = [aws_instance.bastion-instance, module.eks, null_resource.ec2_copy_manifests]
  cluster_name    = module.eks.cluster_name
  namespace       = "default"
  service_account = "aws-cli-sa"
  role_arn        = aws_iam_role.eks_role.arn
}