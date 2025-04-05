variable "tags" {
  type    = map(string)
  default = {
    Project     = "MyApp"
    Environment = "prod"
  }
}
