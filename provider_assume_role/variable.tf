
variable "region" {
  type = string
  default = "us-east-1"
}

variable "assume_role" {

  type = object({
    role_arn    = string
    external_id = string
  })

  default = {
    role_arn    = "arn:aws:iam::000000000000:user/integration_aws"
    external_id = "00000-0000000-000000000-00000"
  }
}
