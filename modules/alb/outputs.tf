output "alb_dns" {
  value = aws_lb.app.dns_name
}

output "listener_arn" {
  value = aws_lb_listener.http.arn
}

output "tg_service1_arn" {
  value = aws_lb_target_group.service1.arn
}

output "tg_service2_arn" {
  value = aws_lb_target_group.service2.arn
}
