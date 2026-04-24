# IaC Demo — Home NAS Infrastructure

A personal Infrastructure as Code project demonstrating real-world DevOps practices.

## Stack
- **Terraform** — provisions Docker containers as code
- **Ansible** — configures server and manages services
- **Docker** — runs containerised applications
- **GitHub Actions** — CI/CD pipeline for automated deployments

## Infrastructure
- Nginx web server running in Docker (port 8080)
- NAS file sharing via Samba
- Remote access via Tailscale VPN

## Usage
### Terraform
terraform init
terraform plan
terraform apply

### Ansible
ansible-playbook playbook.yml
