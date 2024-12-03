
/*
Crei um usuário:
    AWS Configure...
Crie uma assume role:

    https://www.uuidgenerator.net/version4#google_vignette
    Role > AWS Account > external ID > 00000-0000-0000-0000-0000000
    Edit a role e modifique da conta "root" para a o arn do seu user.

    $ aws sts get-caller-identity
    {
        "UserId": "00000000000",
        "Account": "00000000000",
        "Arn": "arn:aws:iam::00000000:user/devops_samir"
    }
*/

terraform {
  required_providers {
    aws = {
      source  = "value"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
  assume_role {
    role_arn    = var.assume_role.role_arn
    external_id = var.assume_role.external_id
  }
}