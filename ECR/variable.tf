variable "ecr_repo" {
  type = list(object({
    name = string
  }))

  default = [
    {
      name = "teamname/dev/frontend"
    },
    {
      name = "teamname/dev/backend"
    }
  ]
}

variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
    productname = "eks-2024"
    teamname    = "devops"
    centercost  = "777"
  }
}