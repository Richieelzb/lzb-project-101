data "aws_availability_zones" "my-zones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

data "aws_ami" "amzn2023_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

data "archive_file" "manifests_zip" {
  type        = "zip"
  source_dir  = "${path.module}/manifests"
  output_path = "${path.module}/manifests.zip"
}

data "template_cloudinit_config" "config" {
  gzip          = false
  base64_encode = true

  # part {
  #   filename     = "docker.sh"
  #   content_type = "text/x-shellscript"
  #   content      = file("${path.module}/bash-scripts/docker-install.sh")
  # }

  part {
    filename     = "kubectl.sh"
    content_type = "text/x-shellscript"
    content      = file("${path.module}/bash-scripts/kubectl-install.sh")
  }

  part {
    filename     = "helm.sh"
    content_type = "text/x-shellscript"
    content      = file("${path.module}/bash-scripts/helm-install.sh")
  }

  part {
    filename     = "secret-store.sh"
    content_type = "text/x-shellscript"
    content      = file("${path.module}/bash-scripts/helm-repo-secrets-store-csi-driver.sh")
  }

  part {
    filename     = "secret-store.sh"
    content_type = "text/x-shellscript"
    content      = file("${path.module}/bash-scripts/helm-secrets-manager.sh")
  }

  part {
    filename     = "secret-store.sh"
    content_type = "text/x-shellscript"
    content      = file("${path.module}/bash-scripts/helm-secrets-store-csi-driver.sh")
  }

  part {
    filename     = "secret-store.sh"
    content_type = "text/x-shellscript"
    content      = file("${path.module}/bash-scripts/kubectl-apply-store-csi-driver.sh")
  }
}