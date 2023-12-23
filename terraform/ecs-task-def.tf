resource "aws_ecs_task_definition" "task" {
  family                   = "my-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([{
    name  = "my-app",
    image = "my-app-image-url",  // Replace with your Docker image URL
    portMappings = [{
      containerPort = 3000,
      hostPort      = 3000
    }]
  }])
}
