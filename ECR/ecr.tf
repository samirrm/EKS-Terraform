resource "aws_ecr_repository" "this" {
    count = length(var.ecr_repo)
    name = var.ecr_repo[count.index].name
    force_delete = true
    image_tag_mutability = "MUTABLE"
    tags = var.tags
}