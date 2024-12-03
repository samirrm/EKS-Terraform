terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider

# usando principios do well arqtect 
# Rolename minharole-10980971-0470-923-04097250

#Criar uma trust polcy e, assim as acces e secrets ficam renovando periodicamente a cada 1h. caso 

provider "aws" {

  region = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::00000000000:role/Rolename minharole-10980971-0470-923-04097250"
  }

}


