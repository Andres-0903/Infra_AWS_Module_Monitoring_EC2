###Meticas para cada una de las instancias EC2.
resource "aws_cloudwatch_metric_alarm" "ec2_cpu_utilization_high" {
  for_each            = var.ec2_instances
  alarm_name          = "EC2_CPU_Utilization_High_-${var.project}-${var.environment}-${each.key}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = var.cpu_utilization_threshold
  datapoints_to_alarm = 2
  treat_missing_data  = "notBreaching"
  alarm_description   = "Alarm when CPU utilization exceeds"

  dimensions = {
    InstanceId = each.key
  }
}

resource "aws_cloudwatch_metric_alarm" "ec2_memory_utilization_high" {
  for_each            = var.ec2_instances
  alarm_name          = "EC2_Memory_Utilization_High-${var.project}-${var.environment}-${each.key}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  datapoints_to_alarm = 2

  metric_name = "mem_used_percent"
  namespace   = "CWAgent"
  period      = 300
  statistic   = "Average"
  threshold   = var.memory_utilization_threshold

  treat_missing_data = "notBreaching"

  alarm_description = "Memory utilization > ${var.memory_utilization_threshold}%"

  dimensions = {
    InstanceId = each.key
  }
}

resource "aws_cloudwatch_metric_alarm" "ec2_disk_utilization_high" {
  for_each = {
    for i in var.ec2_instances : i.id => i
  }
  alarm_name          = "EC2_Disk_Utilization_High-${var.project}-${var.environment}-${each.key}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  datapoints_to_alarm = 2

  metric_name = "disk_used_percent"
  namespace   = "CWAgent"
  period      = 300
  statistic   = "Average"
  threshold   = var.disk_utilization_threshold

  treat_missing_data = "notBreaching"

  alarm_description = "Disk utilization > ${var.disk_utilization_threshold}%"

  dimensions = {
    InstanceId = each.key
  }
}
