
resource "docker_image" "nginx" {
  name = var.image
}

resource "docker_container" "nginx" {
  count = var.container_count

  name     = "nginx-${count.index + 1}"
  hostname = "nginx-${count.index + 1}"

  image = docker_image.nginx.image_id

  memory     = var.memory
  privileged = var.privileged

  ports {
    internal = 80
    external = var.starting_port + count.index
  }

  command = [
    "/bin/sh",
    "-c",
    "echo '<html><body><h1>Welcome to Nginx!</h1><h2>Hostname: '\"$HOSTNAME\"'</h2></body></html>' > /usr/share/nginx/html/index.html && exec nginx -g 'daemon off;'"
  ]
}
