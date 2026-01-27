###Meticas para cada una de las instancias EC2.
resource "aws_cloudwatch_metric_alarm" "ec2_cpu_utilization_high" {
  for_each            = var.ec2_instances
  alarm_name          = "${var.project}-${var.name_service}-CPUUtilization-${each.key}-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.cpu_utilization_evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = var.cpu_utilization_period
  statistic           = "Maximum"
  threshold           = var.cpu_utilization_threshold
  treat_missing_data  = "notBreaching"
  alarm_description   = "Alarm when CPU utilization exceeds"

  tags = merge({
    name = "${var.project}-${var.name_service}-CPUUtilization-${each.key}-${var.environment}"
  })

  dimensions = {
    InstanceId = each.value.instance.id
  }
}

resource "aws_cloudwatch_metric_alarm" "ec2_memory_utilization_high" {
  for_each            = var.ec2_instances
  alarm_name          = "${var.project}-${var.name_service}-MemoryUtilization-${each.key}-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.memory_utilization_threshold_evaluation_periods
  metric_name         = "mem_used_percent"
  namespace           = "CWAgent"
  period              = var.memory_utilization_period
  statistic           = "Maximum"
  threshold           = var.memory_utilization_threshold
  treat_missing_data  = "notBreaching"
  alarm_description   = "Memory utilization > ${var.memory_utilization_threshold}%"

  tags = merge({
    name = "${var.project}-${var.name_service}-MemoryUtilization-${each.key}-${var.environment}"
  })

  dimensions = {
    InstanceId = aws_instance.public_instances[each.key].id
  }
}

resource "aws_cloudwatch_metric_alarm" "ec2_disk_utilization_high" {
  for_each            = var.ec2_instances
  alarm_name          = "${var.project}-${var.name_service}-DiskUtilization-${each.key}-${var.environment}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.disk_utilization_threshold_evaluation_periods
  metric_name         = "disk_used_percent"
  namespace           = "CWAgent"
  period              = var.disk_utilization_period
  statistic           = "Maximum"
  threshold           = var.disk_utilization_threshold
  treat_missing_data  = "notBreaching"
  alarm_description   = "Disk utilization > ${var.disk_utilization_threshold}%"

  tags = merge({
    name = "${var.project}-${var.name_service}-DiskUtilization-${each.key}-${var.environment}"
  })

  dimensions = {
    InstanceId = aws_instance.public_instances[each.key].id
  }
}
