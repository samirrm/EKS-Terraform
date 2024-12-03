data "aws_iam_policy_document" "assume_role_cluster_eks" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "assume_role_cluster_eks" {
  name               = var.eks_cluster.name_assume_role_cluster_eks
  assume_role_policy = data.aws_iam_policy_document.assume_role_cluster_eks.json
}

resource "aws_iam_role_policy_attachment" "assume_role_cluster_eks_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.assume_role_cluster_eks.name
}