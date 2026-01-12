###Variables generales
variable "ec2_instance_ids" {
  description = "Lista de IDs de las instancias EC2 a monitorear"
  type        = list(string)
  default     = []
}

variable "project" {
  description = "Nombre del proyecto"
  type        = string
  default     = "Monitioreo"
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
  default     = "Dev"
}

###Variables de alerta
variable "cpu_utilization_threshold" {
  description = "Umbral de utilización de CPU para activar la alarma"
  type        = number
  default     = 80
}

###Variable de umbral de memoria
variable "memory_utilization_threshold" {
  description = "Umbral de utilización de memoria para activar la alarma"
  type        = number
  default     = 80
}

###Variable de umbral de disco
variable "disk_utilization_threshold" {
  description = "Umbral de utilización de disco para activar la alarma"
  type        = number
  default     = 80
}
