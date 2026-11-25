
output "container_names" {
  description = "Names of created containers"
  value       = docker_container.nginx[*].name
}

output "container_hostnames" {
  description = "Hostnames of created containers"
  value       = docker_container.nginx[*].hostname
}

output "container_ports" {
  description = "External ports"
  value       = [
    for container in docker_container.nginx :
    container.ports[0].external
  ]
}

output "nginx_urls" {
  description = "URLs to access containers"
  value = [
    for container in docker_container.nginx :
    "http://localhost:${container.ports[0].external}"
  ]
}
