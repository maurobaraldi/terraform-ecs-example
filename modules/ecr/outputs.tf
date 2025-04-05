output "service1_repo_url" {
  value = aws_ecr_repository.service1.repository_url
}

output "service2_repo_url" {
  value = aws_ecr_repository.service2.repository_url
}
