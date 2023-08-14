
resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = var.kubernetes_version

  vpc_config {
    subnet_ids = var.subnet_ids

    security_group_ids = [
      aws_security_group.eks_cluster_sg.id,
      aws_security_group.eks_control_plane_sg.id
    ]
  }

  enabled_cluster_log_types = var.cluster_enabled_log_types

  dynamic "encryption_config" {
    for_each = var.encryption_config

    content {
      provider {
        key_arn = aws_kms_key.eks_cluster_key.arn
      }
      resources = encryption_config.value["resources"]
    }
  }
}

resource "aws_eks_addon" "eks_addon" {
  for_each = {
    for idx, addon in var.addons : idx => {
      name              = addon["name"]
      version           = addon["version"]
      resolve_conflicts = "OVERWRITE"
    }
  }

  cluster_name  = aws_eks_cluster.eks_cluster.name
  addon_name    = each.value.name
  addon_version = each.value.version
}