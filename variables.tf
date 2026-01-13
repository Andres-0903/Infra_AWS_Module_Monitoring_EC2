###Variables generales
variable "ec2_instances" {
  description = "Lista de Instance EC2 a monitorear"
  type = list(object({
    id = string
  }))
}

variable "sns_topic_arn" {
  description = "SNS topic arn"
  type        = list(string)
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
