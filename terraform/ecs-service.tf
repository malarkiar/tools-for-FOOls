resource "aws_ecs_service" "service" {
  name            = "my-service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn
  launch_type     = "FARGATE"

  network_configuration {
    subnets = ["subnet-xxxxxx", "subnet-yyyyyy"]  // Replace with your VPC subnets
  }

  desired_count = 1
}
