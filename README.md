# Infra_AWS_Module_Monitoring_EC2
Modulo de monitoreo para instancias EC2

# Modo de uso
Este módulo de Terraform permite configurar el monitoreo de instancias EC2 en AWS utilizando CloudWatch. Proporciona métricas y alarmas para asegurar que las instancias estén funcionando correctamente y para notificar sobre cualquier problema.

module "ec2_monitoring" {
  source = "git::https://github.com/Andres-0903/Infra_AWS_Module_Monitoring_EC2.git?ref=1.0.1"

  instances         = var.ec2_instances
  project           = var.project
  environment       = var.environment
}
