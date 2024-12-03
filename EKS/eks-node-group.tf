resource "aws_eks_node_group" "this" {

  cluster_name      = var.eks_cluster.name
  node_group_name   = var.eks_cluster.node_group_v1.name

  node_role_arn     = aws_iam_role.assume_role_cluster_eks.arn
  subnet_ids        = aws_subnet.privates_subnets[*].id
  instance_types    = var.eks_cluster.node_group_v1.instance_types
  capacity_type     = var.eks_cluster.node_group_v1.capacity_type

  scaling_config {
    desired_size    = var.eks_cluster.node_group_v1.scaling_config_desired_size
    max_size        = var.eks_cluster.node_group_v1.scaling_config_max_size
    min_size        = var.eks_cluster.node_group_v1.scaling_config_min_size
  }

  update_config {
    max_unavailable = var.eks_cluster.node_group_v1.update_config_max_unavailable
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_node_group_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_cluster_node_group_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks_cluster_node_group_AmazonEC2ContainerRegistryReadOnly,
  ]
  tags = var.tags
}