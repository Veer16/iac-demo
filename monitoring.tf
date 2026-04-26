resource "docker_network" "monitoring" {
  name = "monitoring"
}

resource "docker_image" "prometheus" {
  name         = "prom/prometheus:latest"
  keep_locally = false
}

resource "docker_image" "grafana" {
  name         = "grafana/grafana:latest"
  keep_locally = false
}

resource "docker_image" "node_exporter" {
  name         = "prom/node-exporter:latest"
  keep_locally = false
}

resource "docker_container" "prometheus" {
  image   = docker_image.prometheus.image_id
  name    = "prometheus-tf"
  restart = "unless-stopped"

  ports {
    internal = 9090
    external = 9092
  }

  volumes {
    host_path      = abspath("${path.module}/monitoring/prometheus.yml")
    container_path = "/etc/prometheus/prometheus.yml"
  }

  networks_advanced {
    name = docker_network.monitoring.name
  }
}

resource "docker_container" "grafana" {
  image   = docker_image.grafana.image_id
  name    = "grafana-tf"
  restart = "unless-stopped"

  ports {
    internal = 3000
    external = 3001
  }

  env = [
    "GF_SECURITY_ADMIN_USER=admin",
    "GF_SECURITY_ADMIN_PASSWORD=admin123",
    "GF_USERS_ALLOW_SIGN_UP=false"
  ]

  networks_advanced {
    name = docker_network.monitoring.name
  }
}
