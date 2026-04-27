terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "website" {
  image   = docker_image.nginx.image_id
  name    = "iac-website"
  restart = "always"

  ports {
    internal = 80
    external = 8080
  }

  volumes {
    host_path      = "/srv/website"
    container_path = "/usr/share/nginx/html"
  }
}
