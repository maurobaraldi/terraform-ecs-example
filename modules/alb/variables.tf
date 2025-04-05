variable "vpc_id" {}
variable "public_subnets" {
  type = list(string)
}
variable "security_group_id" {}

variable "internal" {
  description = "Whether the ALB is internal"
  type        = bool
  default     = false
}
