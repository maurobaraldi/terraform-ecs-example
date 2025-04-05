output "cluster_id" {
  value = aws_ecs_cluster.main.id
}

output "service1_task" {
  value = aws_ecs_task_definition.service1.arn
}

output "service2_task" {
  value = aws_ecs_task_definition.service2.arn
}
