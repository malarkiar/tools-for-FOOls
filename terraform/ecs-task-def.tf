resource "aws_ecs_task_definition" "task" {
  family                   = var.ecs_task_family
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.ecs_task_cpu
  memory                   = var.ecs_task_memory
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([{
    name  = "my-app",
    image = var.docker_image_url,
    portMappings = [{
      containerPort = 3000,
      hostPort      = 3000
    }]
  }])
}
