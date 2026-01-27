###Variables generales
variable "ec2_instances" {
  description = "Lista de Instance EC2 a monitorear"
  type = map(object({
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
  default     = "Andres-Monitioreo"
}

variable "environment" {
  description = "Entorno de despliegue"
  type        = string
  default     = "Dev"
}

variable "name_service" {
  description = "Nombre del servicio"
  type        = string
  default     = "EC2"
}

variable "purpose" {
  description = "Propósito del recurso"
  type        = string
  default     = "Monitoring"
}

########################cpu_utilization_high##########
variable "cpu_utilization_evaluation_periods" {
  description = "Número de períodos de evaluación para la alarma de alta utilización de CPU"
  type        = number
  default     = 2 # 2 períodos de evaluación
}

variable "cpu_utilization_period" {
  description = "Período de la métrica en segundos para la alarma de alta utilización de CPU"
  type        = number
  default     = 60 # 60 segundos (1 minuto)  
}

variable "cpu_utilization_threshold" {
  description = "Umbral de utilización de CPU para activar la alarma"
  type        = number
  default     = 60 # 60% de utilización de CPU
}

########################memory_utilization_high##########
variable "memory_utilization_threshold_evaluation_periods" {
  description = "Número de períodos de evaluación para la alarma de alta utilización de memoria"
  type        = number
  default     = 2 # 2 períodos de evaluación
}

variable "memory_utilization_period" {
  description = "Período de la métrica en segundos para la alarma de alta utilización de memoria"
  type        = number
  default     = 60 # 60 segundos (1 minuto)  
}

variable "memory_utilization_threshold" {
  description = "Umbral de utilización de memoria para activar la alarma"
  type        = number
  default     = 80 # 80% de utilización de memoria
}

########################disk_utilization##########
variable "disk_utilization_threshold_evaluation_periods" {
  description = "Número de períodos de evaluación para la alarma de alta utilización de disco"
  type        = number
  default     = 2 # 2 períodos de evaluación
}

variable "disk_utilization_period" {
  description = "Período de la métrica en segundos para la alarma de alta utilización de disco"
  type        = number
  default     = 60 # 60 segundos (1 minuto)  
}

variable "disk_utilization_threshold" {
  description = "Umbral de utilización de disco para activar la alarma"
  type        = number
  default     = 85 # 85% de utilización de disco
}
