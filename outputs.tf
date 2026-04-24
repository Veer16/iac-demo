output "container_name" {
  description = "Name of the running container"
  value       = docker_container.website.name
}

output "website_url" {
  description = "URL to access the website"
  value       = "http://100.88.128.72:8080"
}
