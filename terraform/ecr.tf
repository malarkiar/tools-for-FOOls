resource "aws_ecr_repository" "my_repository" {
  name                 = "my-app-repository"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "MyAppRepository"
  }
}
