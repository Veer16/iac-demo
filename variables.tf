variable "container_name" {
  description = "Name of the Docker container"
  type        = string
  default     = "iac-website"
}

variable "external_port" {
  description = "External port for the website"
  type        = number
  default     = 8080
}
