# 📊🤖 Módulo de Monitoreo para Instancias EC2 (AWS)

Este módulo de Terraform permite configurar **monitoreo avanzado y alarmas automáticas** para instancias EC2 utilizando **Amazon CloudWatch**.
Incluye alarmas críticas preconfiguradas para CPU, memoria, disco, _status checks_ y otras métricas clave de salud.
Soporta múltiples instancias simultáneamente y permite enviar notificaciones mediante **Amazon SNS**.

---

## 🚀 Características principales

✔ Soporte para múltiples EC2 mediante estructura `map(object)`  
✔ Alarmas en CloudWatch para:

- Alta utilización de CPU
- Alta utilización de memoria
- Alta utilización de disco
- StatusCheckFailed (Instance/System) _(si está implementado en el módulo)_
- Network In / Network Out _(opcional si decides agregarlo)_

✔ Notificaciones vía SNS (`sns_topic_arn`)  
✔ Totalmente configurable mediante variables  
✔ Arquitectura completamente Infrastructure as Code (IaC)

---

## 📦 Requisitos

- Terraform `>= 1.0`
- AWS CLI configurado
- Permisos para crear:
  - CloudWatch Alarms
  - IAM Roles (si aplica)
  - SNS Topics
- Instancias EC2 existentes

---

## 📥 Instalación

Incluye este bloque de módulo en tu configuración Terraform:

```hcl
module "ec2_monitoring" {
  source = "git::https://github.com/Andres-0903/Infra_AWS_Module_Monitoring_EC2.git?ref=1.0.4"

  ec2_instances = {
    ec2_01 = { id = "i-0123456789abcdef0" }
    ec2_02 = { id = "i-0fedcba9876543210" }
  }

  sns_topic_arn = [
    aws_sns_topic.alerts.arn
  ]

  project      = var.project
  environment  = var.environment
  name_service = var.name_service
  purpose      = var.purpose

  # Parámetros de umbrales (opcionales; se muestran valores por defecto)
  cpu_utilization_evaluation_periods               = var.cpu_utilization_evaluation_periods
  cpu_utilization_period                           = var.cpu_utilization_period
  cpu_utilization_threshold                        = var.cpu_utilization_threshold
  memory_utilization_threshold_evaluation_periods  = var.memory_utilization_threshold_evaluation_periods
  memory_utilization_period                        = var.memory_utilization_period
  memory_utilization_threshold                     = var.memory_utilization_threshold
  disk_utilization_threshold_evaluation_periods    = var.disk_utilization_threshold_evaluation_periods
  disk_utilization_period                          = var.disk_utilization_period
  disk_utilization_threshold                       = var.disk_utilization_threshold
}
```

> Ajusta el tag (`ref=1.0.4`) según la versión que estés usando.

---

## 🔧 Variables

### 📌 Variables principales

```hcl
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
```

---

## 🔧 Variables de alarmas (configurables)

### 🔥 CPU Utilization High

```hcl
variable "cpu_utilization_evaluation_periods" {
  description = "Número de períodos de evaluación para la alarma de alta utilización de CPU"
  type        = number
  default     = 2
}

variable "cpu_utilization_period" {
  description = "Período de la métrica en segundos para la alarma de alta utilización de CPU"
  type        = number
  default     = 60
}

variable "cpu_utilization_threshold" {
  description = "Umbral de utilización de CPU para activar la alarma"
  type        = number
  default     = 60
}
```

### 🧠 Memory Utilization High

```hcl
variable "memory_utilization_threshold_evaluation_periods" {
  description = "Número de períodos de evaluación para la alarma de alta utilización de memoria"
  type        = number
  default     = 2
}

variable "memory_utilization_period" {
  description = "Período de la métrica en segundos para la alarma de alta utilización de memoria"
  type        = number
  default     = 60
}

variable "memory_utilization_threshold" {
  description = "Umbral de utilización de memoria para activar la alarma"
  type        = number
  default     = 80
}
```

### 💽 Disk Utilization High

```hcl
variable "disk_utilization_threshold_evaluation_periods" {
  description = "Número de períodos de evaluación para la alarma de alta utilización de disco"
  type        = number
  default     = 2
}

variable "disk_utilization_period" {
  description = "Período de la métrica en segundos para la alarma de alta utilización de disco"
  type        = number
  default     = 60
}

variable "disk_utilization_threshold" {
  description = "Umbral de utilización de disco para activar la alarma"
  type        = number
  default     = 85
}
```

---

## 📤 Outputs

```hcl
output "alarms_created" {
  description = "Lista de alarmas creadas por instancia EC2"
  value       = module.ec2_monitoring.alarms_created
}
```

> Ajusta el nombre del output según el que exporte realmente tu módulo.

---

## 📘 Ejemplo completo

```hcl
module "ec2_monitoring" {
  source = "git::https://github.com/Andres-0903/Infra_AWS_Module_Monitoring_EC2.git?ref=1.0.4"

  ec2_instances = {
    app_a = { id = "i-0a1b2c3d4e5f6g7h8" }
    app_b = { id = "i-0f1e2d3c4b5a6978" }
  }

  sns_topic_arn = [
    aws_sns_topic.alerts.arn
  ]

  project      = "Platform-team"
  environment  = "dev"
  name_service = "EC2"
  purpose      = "Monitoring"

  # Overwrite opcional de umbrales
  cpu_utilization_threshold  = 70
  memory_utilization_period  = 120
  disk_utilization_threshold = 90
}
```

---

## 🛠️ Comandos útiles

```bash
terraform init -upgrade
terraform validate
terraform plan
terraform apply
```

---

## 📄 Licencia

Este proyecto está bajo licencia MIT.  
Puedes usarlo libremente siguiendo las condiciones incluidas en el archivo `LICENSE`.

---

## 👨‍💻 Autor

**Giovanny Andrés Arenas García**  
Repositorio: https://github.com/Andres-0903/Infra_AWS_Module_Monitoring_EC2
