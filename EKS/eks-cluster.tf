resource "aws_eks_cluster" "this" {
  name     = var.eks_cluster.name

  role_arn = aws_iam_role.assume_role_cluster_eks.arn
  enabled_cluster_log_types = var.eks_cluster.enabled_cluster_log_types  # https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html

  vpc_config {
    subnet_ids = [aws_subnet.privates_subnets[*].id]
  }

  access_config {
    authentication_mode = var.eks_cluster.access_config
  }

  depends_on = [
    aws_iam_role_policy_attachment.assume_role_cluster_eks_AmazonEKSClusterPolicy
  ]

  tags = var.tags
}