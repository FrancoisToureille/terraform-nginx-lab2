
variable "image" {
  description = "Docker image to use"
  type        = string
  default     = "nginx:latest"
}

variable "memory" {
  description = "Container memory limit in MB"
  type        = number
  default     = 256
}

variable "privileged" {
  description = "Run container in privileged mode"
  type        = bool
  default     = false
}

variable "container_count" {
  description = "Number of containers to create"
  type        = number
  default     = 3
}

variable "starting_port" {
  description = "Starting external port"
  type        = number
  default     = 3000
}
