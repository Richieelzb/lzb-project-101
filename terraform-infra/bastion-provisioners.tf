resource "null_resource" "ec2_copy_manifests" {
  depends_on = [aws_instance.main-instance, module.eks]

  triggers = {
    # Re-run when any file under eks-resources changes
    manifest_hash = sha1(join(",", [
      for f in fileset(path.module, "eks-resources/**") : filesha1("${path.module}/${f}")
    ]))
    # Re-run when cluster details change
    cluster_name = module.eks.cluster_name
    cluster_arn  = module.eks.cluster_arn
  }

  connection {
    type        = "ssh"
    host        = aws_eip.bastion-eip.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("${path.module}/../lupfumo-key-mumbai.pem")
  }

  provisioner "file" {
    source      = data.archive_file.manifests_zip.output_path
    destination = "/tmp/manifests.zip"
  }

  provisioner "remote-exec" {
    inline = [
      # Update kubeconfig for this user
      "aws eks update-kubeconfig --region ap-south-1 --name ${module.eks.cluster_name}"
    ]
  }

}