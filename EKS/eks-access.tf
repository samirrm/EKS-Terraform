resource "aws_eks_access_policy_association" "admin" {
  cluster_name  = aws_eks_cluster.this.name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy" 
  
  # Remover arn no commit #principal_arn = aws_iam_user.example.arn
  principal_arn = "arn:aws:iam::00000000:user/pmenos_integration_aws_azure_devops_prd"

  access_scope {
    type       = "cluster"
    #namespaces = ["example-namespace"]
  }
}

resource "aws_eks_access_entry" "this" {
  cluster_name      = aws_eks_cluster.this.name
  principal_arn     = "arn:aws:iam::00000000:user/pmenos_integration_aws_azure_devops_prd"
  type              = "STANDARD"
}

# aws eks list-access-policies

# aws eks update-kubeconfig --region us-east-2 --name eks-dev-01 #--profile DevOpsRW

# k port-forward po 8080:80